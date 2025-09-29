import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:frappe_client/frappe_client.dart';
import 'package:intl/intl.dart';
import 'package:secure_storage/secure_storage.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc({required this.frappe, required this.secureStorage})
    : super(SplashState.initial()) {
    on<SplashStartedEvent>(_onSplashStartedEvent);
  }

  final FrappeClient frappe;
  final SecureStorage secureStorage;

  Future<void> _onSplashStartedEvent(
    SplashStartedEvent event,
    Emitter<SplashState> emit,
  ) async {
    await Future<void>.delayed(const Duration(seconds: 3));
    frappe.cookie = await secureStorage.read(key: 'cookie');

    final showOnboarding = await _checkOnboardingStatus();

    if (showOnboarding) {
      emit(state.copyWith(navigationTarget: NavigationTarget.onboardingPage));
    } else {
      final isAuthenticated = await _checkAuthenticationStatus();
      if (!isAuthenticated) {
        emit(state.copyWith(navigationTarget: NavigationTarget.loginPage));
      } else {
        emit(state.copyWith(navigationTarget: NavigationTarget.deskPage));
      }
    }
  }

  Future<bool> _checkOnboardingStatus() async {
    final completedOnboarding = await secureStorage.read(
      key: 'completedOnboarding',
    );
    return completedOnboarding != 'true';
  }

  Future<bool> _checkAuthenticationStatus() async {
    final cookie = frappe.cookie;

    if (cookie == null || cookie.isEmpty) return false;

    final expiryMatch = RegExp('Expires=([^;]+)').firstMatch(cookie);
    if (expiryMatch != null) {
      final expiryString = expiryMatch.group(1)?.trim();

      try {
        final expiryDate = DateFormat(
          "EEE, dd MMM yyyy HH:mm:ss 'GMT'",
        ).parseUtc(expiryString!);
        final currentUtcTime = DateTime.now().toUtc();

        if (currentUtcTime.isAfter(expiryDate)) {
          await secureStorage.delete(key: 'cookie');
          await secureStorage.delete(key: 'username');
          await secureStorage.delete(key: 'userId');

          return false;
        } else {}
      } catch (e) {
        return false;
      }
    }

    return true;
  }
}
