import 'dart:io';

import 'package:cross_file/cross_file.dart';
import 'package:flutter_base_kit/flutter_base_kit.dart';
import 'package:path_provider/path_provider.dart';

/// Configure file logging for native platforms (iOS, Android, macOS, Linux, Windows)
Future<void> configurePlatformLogger([LogOutputHandler? outputHandler]) async {
  try {
    // Get cache directory
    final appDocDir = await getApplicationCacheDirectory();
    final logFilePath = '${appDocDir.path}/app_logs.txt';
    final logFile = File(logFilePath);

    loggerApp.i('Log file path: $logFilePath');

    // Set up file output handler with rotation
    loggerApp.setOutputHandler((logMessage) async {
      try {
        outputHandler?.call(logMessage);
      } catch (e) {
        print('Failed to write log to output handler: $e');
      }
      try {
        // Check file size and rotate if needed (max 5MB)
        if (await logFile.exists()) {
          final fileSize = await logFile.length();
          if (fileSize > 5 * 1024 * 1024) {
            // Rotate: rename current to .old
            final oldFile = File('$logFilePath.old');
            if (await oldFile.exists()) {
              await oldFile.delete();
            }
            await logFile.rename(oldFile.path);
          }
        }

        // Append to file
        await logFile.writeAsString(
          '$logMessage\n',
          mode: FileMode.append,
        );
      } catch (e) {
        // Ignore file write errors to prevent logging loops
        // ignore: avoid_print
        print('Failed to write log to file: $e');
      }
    });

    loggerApp.i('Native file logging configured');
  } catch (e) {
    loggerApp.e('Failed to configure file logging', error: e);
  }
}

/// Get all logs as a string
Future<String> getLogs() async {
  try {
    final appDocDir = await getApplicationCacheDirectory();
    final logFilePath = '${appDocDir.path}/app_logs.txt';
    final logFile = File(logFilePath);

    if (await logFile.exists()) {
      return await logFile.readAsString();
    }
  } catch (e) {
    loggerApp.e('Failed to get logs', error: e);
  }
  return '';
}

/// Get the log file for reading/sharing
Future<XFile?> getLogFile() async {
  try {
    final appDocDir = await getApplicationCacheDirectory();
    final logFilePath = '${appDocDir.path}/app_logs.txt';
    final logFile = File(logFilePath);

    if (await logFile.exists()) {
      return XFile(logFilePath);
    }
  } catch (e) {
    loggerApp.e('Failed to get log file', error: e);
  }
  return null;
}

/// Download logs (no-op on native, for web compatibility)
void downloadLogs({String filename = 'app_logs.txt'}) {
  // No-op on native platforms
}

/// Clear all logs
Future<void> clearLogs() async {
  try {
    final appDocDir = await getApplicationCacheDirectory();
    final logFilePath = '${appDocDir.path}/app_logs.txt';
    final logFile = File(logFilePath);

    if (await logFile.exists()) {
      await logFile.delete();
    }

    final oldFile = File('$logFilePath.old');
    if (await oldFile.exists()) {
      await oldFile.delete();
    }

    loggerApp.i('Logs cleared successfully');
  } catch (e) {
    loggerApp.e('Failed to clear logs', error: e);
  }
}
