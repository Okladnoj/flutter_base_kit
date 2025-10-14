import 'dart:convert';
import 'dart:js_interop';

import 'package:flutter_base_kit/flutter_base_kit.dart';
import 'package:web/web.dart' as web;

const String _storageKey = 'app_logs';
const int _maxLogEntries = 1000;

/// Configure LocalStorage logging for web platform
Future<void> configurePlatformLogger() async {
  final logs = <String>[];

  // Load existing logs from LocalStorage
  _loadExistingLogs(logs);

  // Set up LocalStorage output handler
  loggerApp.setOutputHandler((logMessage) {
    try {
      logs.add(logMessage);

      // Keep only last N entries (rotation)
      if (logs.length > _maxLogEntries) {
        logs.removeAt(0);
      }

      // Save to LocalStorage
      _saveLogsToStorage(logs);
    } catch (e) {
      // Ignore storage errors to prevent logging loops
      // ignore: avoid_print
      print('Failed to save log to LocalStorage: $e');
    }
  });

  loggerApp
      .i('Web LocalStorage logging configured (max: $_maxLogEntries entries)');
}

void _loadExistingLogs(List<String> logs) {
  try {
    final storedLogs = web.window.localStorage.getItem(_storageKey);
    if (storedLogs != null) {
      final decodedLogs = (jsonDecode(storedLogs) as List).cast<String>();
      logs.addAll(decodedLogs);
      loggerApp.i('Loaded ${decodedLogs.length} existing log entries');
    }
  } catch (e) {
    // Ignore errors loading old logs
    loggerApp.w('Could not load existing logs: $e');
  }
}

void _saveLogsToStorage(List<String> logs) {
  try {
    web.window.localStorage.setItem(_storageKey, jsonEncode(logs));
  } catch (e) {
    // Storage quota exceeded or disabled
    // Try to free up space by removing old entries
    if (logs.length > 100) {
      logs.removeRange(0, logs.length - 100);
      try {
        web.window.localStorage.setItem(_storageKey, jsonEncode(logs));
      } catch (_) {
        // Still failing, give up
      }
    }
  }
}

/// Get all logs as a string
String getLogs() {
  try {
    final storedLogs = web.window.localStorage.getItem(_storageKey);
    if (storedLogs != null) {
      final logs = (jsonDecode(storedLogs) as List).cast<String>();
      return logs.join('\n');
    }
  } catch (e) {
    loggerApp.e('Failed to get logs', error: e);
  }
  return '';
}

/// Download logs as a text file
void downloadLogs({String filename = 'app_logs.txt'}) {
  try {
    final content = getLogs();
    final blob = web.Blob([content.toJS].toJS);
    final url = web.URL.createObjectURL(blob);
    final anchor = web.document.createElement('a') as web.HTMLAnchorElement
      ..href = url
      ..download = filename;
    anchor.click();
    web.URL.revokeObjectURL(url);

    loggerApp.i('Logs downloaded as $filename');
  } catch (e) {
    loggerApp.e('Failed to download logs', error: e);
  }
}

/// Clear all logs
Future<void> clearLogs() async {
  try {
    web.window.localStorage.removeItem(_storageKey);
    loggerApp.i('Logs cleared successfully');
  } catch (e) {
    loggerApp.e('Failed to clear logs', error: e);
  }
}

/// Get the log file for reading/sharing (stub for web compatibility)
Future<dynamic> getLogFile() async {
  return null;
}
