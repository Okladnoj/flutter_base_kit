/// Global logger instance for the Flutter Base Kit
final loggerApp = _LoggerStub();

/// Custom logger class with simplified methods for web platform
class _LoggerStub {
  final l = 100;

  /// Log info message
  void i(dynamic message) {
    _log('INFO', message);
  }

  /// Log debug message with stack trace
  void d(dynamic message) {
    _log('DEBUG', message);
  }

  /// Log warning message
  void w(dynamic message) {
    _log('WARNING', message);
  }

  /// Log error message with optional error and stack trace
  void e(
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    _log('ERROR', message);
    if (error != null) {
      _log('ERROR', 'Error: $error');
    }
    if (stackTrace != null) {
      _log('ERROR', 'StackTrace: $stackTrace');
    }
  }

  /// Log fatal message
  void f(dynamic message) {
    _log('FATAL', message);
  }

  /// Log trace message
  void t(dynamic message) {
    _log('TRACE', message);
  }

  /// Log with custom level
  void log(String level, dynamic message) {
    _log(level, message);
  }

  /// Internal logging method
  void _log(String level, dynamic message) {
    final timestamp = DateTime.now().toIso8601String();
    print('[$timestamp] $level: $message');
  }
}
