import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:isolate';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

/// A logger for the app.
class AppLogger {
  /// The logger instance.
  static late final Logger log;

  /// The map of log files.
  static final Map<LogType, File> logFiles = {};

  /// Initializes the logger.
  static void initialize({bool verbose = false}) {
    log = Logger(
      level: kDebugMode || (verbose && kReleaseMode) ? Level.all : Level.info,
    );
  }

  /// Runs a function in a zoned environment.
  static R? runZoned<R>(
    R Function() body, {
    LogType logType = LogType.general,
  }) {
    return runZonedGuarded<R>(
      () {
        WidgetsFlutterBinding.ensureInitialized();

        FlutterError.onError = (details) {
          reportError(details.exception, details.stack ?? StackTrace.current);
        };

        PlatformDispatcher.instance.onError = (error, stackTrace) {
          reportError(error, stackTrace);
          return true;
        };

        if (!kIsWeb) {
          Isolate.current.addErrorListener(
            RawReceivePort((List<dynamic> pair) async {
              final isolateError = pair;
              await reportError(
                isolateError.first.toString(),
                isolateError.last as StackTrace?,
              );
            }).sendPort,
          );
        }

        if (!kIsWeb) {
          getLogsPath(logType).then((file) => logFiles[logType] = file);
        }

        return body();
      },
      reportError,
    );
  }

  /// Gets the path of the log file.
  static Future<File> getLogsPath(LogType type) async {
    if (kIsWeb) {
      throw UnsupportedError(
        'File operations are not supported on web platform',
      );
    }

    final dir = await _getLogDirectory();
    final file = File(join(dir, 'frappify-${type.name}.log'));

    final now = DateTime.now();

    if (file.existsSync()) {
      final logDate = await _getLogFileDate(file);

      // Check if the log file is from a previous day
      if (logDate != null &&
          (logDate.year != now.year ||
              logDate.month != now.month ||
              logDate.day != now.day)) {
        await _archiveLogFile(file, type, logDate);
      }
    } else {
      await file.create(recursive: true);
    }

    return file;
  }

  /// Gets the date of the log file.
  static Future<DateTime?> _getLogFileDate(File file) async {
    if (!file.existsSync() || await file.length() == 0) {
      return null;
    }

    try {
      // Read only the first line of the file
      final stream = file.openRead();
      final firstLine = await stream
          .transform(const Utf8Decoder())
          .transform(const LineSplitter())
          .take(1)
          .first;

      // Extract date from format like [2025-02-10 11:05:54.854748]-------------
      final dateRegex = RegExp(r'\[([\d\-\s\:\.]+)\]');
      final match = dateRegex.firstMatch(firstLine);

      if (match != null && match.groupCount >= 1) {
        final dateString = match.group(1)?.trim();
        if (dateString != null) {
          return DateTime.parse(dateString);
        }
      }
    } catch (e) {
      log.e('Error reading log file date', error: e);
    }

    // Fallback to file modified date if we can't extract from content
    return file.statSync().modified;
  }

  static Future<void> _archiveLogFile(
    File file,
    LogType type,
    DateTime logDate,
  ) async {
    if (kIsWeb) return;

    // Check if the file exists before attempting to archive it
    if (!file.existsSync()) {
      log.w('Log file does not exist: ${file.path}');
      return;
    }

    try {
      final date = logDate.toString().split(' ')[0];
      final archiveDir = file.parent.path;
      final fileName = basename(file.path);
      final archiveFileName = '$fileName-$date.tar.gz';

      // Create a temporary directory for archiving
      final tempDir = Directory(join(archiveDir, 'temp_archive'));
      if (!tempDir.existsSync()) {
        await tempDir.create();
      }

      // Copy the log file to the temporary directory with its original name
      final tempFile = File(join(tempDir.path, fileName));
      await file.copy(tempFile.path);

      // Change to the temporary directory before running tar command
      final currentDir = Directory.current;
      Directory.current = tempDir;

      // Create archive in the parent directory
      final archiveFilePath = join(archiveDir, archiveFileName);
      final process = await Process.start(
        'tar',
        ['-czf', archiveFilePath, fileName],
      );
      final exitCode = await process.exitCode;

      // Return to original directory
      Directory.current = currentDir;

      if (exitCode != 0) {
        log.e('Failed to archive log file: ${file.path}');
      }

      // Clean up temporary directory and its contents
      if (tempDir.existsSync()) {
        await tempDir.delete(recursive: true);
      }

      // Clear the original log file instead of deleting it
      file.writeAsStringSync('');
    } catch (e, stack) {
      log.e('Error while archiving log file', error: e, stackTrace: stack);
      // If archiving fails, just clear the file
      if (file.existsSync()) {
        file.writeAsStringSync('');
      }
    }
  }

  /// Reports an error.
  static Future<void> reportError(
    dynamic error, [
    StackTrace? stackTrace,
    String message = '',
    LogType logType = LogType.general,
  ]) async {
    log.e(message, error: error, stackTrace: stackTrace);

    if (!kIsWeb) {
      final logFile = logFiles[logType] ?? await getLogsPath(logType)
        ..writeAsStringSync(
          '[${DateTime.now()}]---------------------\n'
          '$error\n$stackTrace\n'
          '----------------------------------------\n',
          mode: FileMode.writeOnlyAppend,
        );
    }
  }

  /// Logs an info message.
  static Future<void> logInfo([
    String message = '',
    LogType logType = LogType.general,
  ]) async {
    log.i(message);

    if (!kIsWeb) {
      final logFile = logFiles[logType] ?? await getLogsPath(logType)
        ..writeAsStringSync(
          '[${DateTime.now()}]---------------------\n'
          '$message\n'
          '-------------------------------------------------\n',
          mode: FileMode.writeOnlyAppend,
        );
    }
  }

  /// Gets the log directory.
  static Future<String> _getLogDirectory() async {
    if (kIsWeb) {
      throw UnsupportedError(
        'File operations are not supported on web platform',
      );
    }

    var customPath = '';

    if (Platform.isLinux) {
      final homeDir = Platform.environment['HOME'];
      if (homeDir != null) {
        customPath = '$homeDir/.frappify/logs';
      }
    } else if (Platform.isWindows) {
      final homeDir = Platform.environment['USERPROFILE'];
      if (homeDir != null) {
        customPath = '$homeDir\\frappify\\logs';
      }
    } else if (Platform.isMacOS || Platform.isIOS) {
      final directory = await getApplicationDocumentsDirectory();
      customPath = '${directory.path}/.frappify/logs';
    } else if (Platform.isAndroid) {
      final directory = await getApplicationDocumentsDirectory();
      // final directory = await getExternalStorageDirectory();
      // final directory = Platform.environment['EXTERNAL_STORAGE'];
      customPath = '${directory.path}/.frappify/logs';
      // customPath = '$directory/.frappify/logs';
    }

    final dir = Directory(customPath);
    await dir.create(recursive: true);

    return customPath;
  }
}

/// The type of log.
enum LogType {
  /// The general log type.
  general,

  /// The database log type.
  database,

  /// The schedule log type.
  schedule,

  /// The network log type.
  network,
}
