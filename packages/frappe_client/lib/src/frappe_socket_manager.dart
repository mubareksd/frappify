import 'dart:async';
import 'package:app_logger/app_logger.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

/// A socket?.IO manager for integrating with Frappe’s real-time server.
/// Provides connection lifecycle callbacks, automatic reconnection,
/// event queuing during disconnection, and dynamic event subscriptions.
class FrappeSocketManager {
  /// Creates a new FrappeSocketManager instance.
  FrappeSocketManager({
    required this.baseUrl,
    this.sessionCookie,
    this.onConnected,
    this.onDisconnected,
    this.onError,
    this.onAnyEvent,
  });

  IO.Socket? socket;
  final String baseUrl;
  final String? sessionCookie;

  final Map<String, void Function(dynamic)> eventHandlers = {};
  final List<PendingEvent> pendingEmits = [];

  /// Called when the socket successfully connects to the server.
  void Function()? onConnected;

  /// Called when the socket disconnects from the server.
  void Function()? onDisconnected;

  /// Called when an error occurs during connection or communication.
  void Function(dynamic error)? onError;

  /// Called whenever any event is received, regardless of registration.
  void Function(String event, dynamic data)? onAnyEvent;

  Timer? _reconnectTimer;
  bool _isConnected = false;
  bool _manuallyDisconnected = false;

  /// Establishes a connection to the Frappe server.
  /// Handles socket events and registers predefined event handlers.
  void connect() {
    _manuallyDisconnected = false;

    socket = IO.io(
      baseUrl,
      IO.OptionBuilder()
          .setTransports(['websocket'])
          .setExtraHeaders({
            if (sessionCookie != null) 'Cookie': sessionCookie,
          })
          .disableAutoConnect()
          .build(),
    );

    socket
      ?..onConnect((_) {
        _isConnected = true;
        AppLogger.logInfo('✅ Connected to Frappe');
        onConnected?.call();
        reSendPendingEvents();
      })
      ..onDisconnect((_) {
        _isConnected = false;
        AppLogger.reportError('⚠️ Disconnected from Frappe');
        onDisconnected?.call();

        if (!_manuallyDisconnected) {
          scheduleReconnect();
        }
      })
      ..onConnectError((error) {
        AppLogger.reportError('❌ Connection error: $error');
        onError?.call(error);

        if (!_manuallyDisconnected) {
          scheduleReconnect();
        }
      })
      ..onError((error) {
        AppLogger.reportError('❌ Socket error: $error');
        onError?.call(error);
      })

      /// Registers a catch-all handler for any event.
      ..onAny((String event, data) {
        AppLogger.logInfo('📡 Event received: $event => $data');
        onAnyEvent?.call(event, data);
      });

    /// Re-attach any predefined custom event handlers
    eventHandlers.forEach((event, handler) {
      socket?.on(event, handler);
    });

    socket?.connect();
  }

  /// Disconnects the socket manually and cancels any reconnect attempts.
  void disconnect() {
    _manuallyDisconnected = true;
    socket?.disconnect();
    _reconnectTimer?.cancel();
    AppLogger.reportError('🔌 Manually disconnected');
  }

  /// Emits an event with optional data.
  /// If not connected, the event is queued and retried upon reconnection.
  void emit(String event, dynamic data) {
    if (_isConnected) {
      socket?.emit(event, data);
      AppLogger.logInfo('📤 Event emitted: $event => $data');
    } else {
      AppLogger.logInfo('⏳ Socket disconnected, queuing event: $event');
      pendingEmits.add(PendingEvent(event, data));
    }
  }

  /// Subscribes to a custom event from the server.
  void on(String event, void Function(dynamic) handler) {
    eventHandlers[event] = handler;
    socket?.on(event, handler);
  }

  /// Removes previously registered event handler.
  void removeEvent(String event) {
    eventHandlers.remove(event);
    socket?.off(event);
  }

  /// Re-sends any events that were queued during disconnection.
  void reSendPendingEvents() {
    AppLogger.logInfo('📦 Re-sending ${pendingEmits.length} pending events');
    for (final evt in pendingEmits) {
      socket?.emit(evt.event, evt.data);
    }
    pendingEmits.clear();
  }

  /// Schedules an automatic reconnection attempt after a short delay.
  void scheduleReconnect() {
    if (_reconnectTimer?.isActive ?? false) return;

    AppLogger.logInfo('🔁 Attempting to reconnect in 5 seconds...');
    _reconnectTimer = Timer(const Duration(seconds: 5), () {
      if (!_isConnected && !_manuallyDisconnected) {
        connect();
      }
    });
  }
}

/// A helper class to store pending events emitted during disconnection.
class PendingEvent {
  final String event;
  final dynamic data;

  PendingEvent(this.event, this.data);
}
