import 'package:flutter/foundation.dart';
import 'package:flutter_base_kit/flutter_base_kit.dart';
import 'package:injectable/injectable.dart';
import 'package:share_plus/share_plus.dart';

import '../../di/di.dart';
import '../../services/logger/logger_config.dart';

@singleton
class LogsState extends BaseProvider {
  static LogsState get _instance => locator();
  static LogsState get instance => _instance;

  final _logs = <String>[];

  List<String> get logs => List.unmodifiable(_logs);
  bool get hasLogs => _logs.isNotEmpty;
  String get logsContent => _logs.join('\n');

  Future<void> initialize() async {
    await configureLogger((logMessage) {
      _logs.add(logMessage);
      notifyListeners();
    });
  }

  Future<void> loadLogs() async {
    try {
      final existingLogs = await getLogs();
      _logs.clear();
      if (existingLogs.isNotEmpty) {
        _logs.addAll(existingLogs.split('\n').where((l) => l.isNotEmpty));
      }
      notifyListeners();
    } catch (e) {
      loggerApp.e('Failed to load logs', error: e);
    }
  }

  Future<void> shareLogs({
    required VoidCallback onSuccess,
    required VoidCallback onError,
    required String subject,
  }) async {
    try {
      final logFile = await getLogFile();
      if (logFile == null) {
        throw const BaseException(message: 'Log file not found');
      }

      await SharePlus.instance.share(
        ShareParams(
          files: [logFile],
          subject: subject,
        ),
      );
      onSuccess();
    } catch (e) {
      loggerApp.e('Failed to share logs', error: e);
      onError();
    }
  }

  Future<void> clear({
    required VoidCallback onSuccess,
    required VoidCallback onError,
  }) async {
    try {
      await clearLogs();
      _logs.clear();
      notifyListeners();
      onSuccess();
    } catch (e) {
      loggerApp.e('Failed to clear logs', error: e);
      onError();
    }
  }
}
