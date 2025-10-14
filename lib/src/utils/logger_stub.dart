/// Global logger instance for the Flutter Base Kit
final loggerApp = _LoggerStub();

/// Callback type for log output handler
typedef LogOutputHandler = void Function(String logMessage);

/// Custom logger class with simplified methods for web platform
class _LoggerStub {
  final l = 100;
  LogOutputHandler? _outputHandler;

  /// Set custom output handler for logs
  ///
  /// The handler will receive formatted log messages as strings.
  /// You can use this to write logs to IndexedDB, LocalStorage, or send to a server.
  ///
  /// Example:
  /// ```dart
  /// loggerApp.setOutputHandler((logMessage) {
  ///   // Store in LocalStorage or IndexedDB
  ///   window.localStorage['logs'] = logMessage;
  /// });
  /// ```
  void setOutputHandler(LogOutputHandler? handler) {
    _outputHandler = handler;
  }

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
    final errorMsg = error != null ? '$message\nError: $error' : message;
    final fullMsg =
        stackTrace != null ? '$errorMsg\nStackTrace: $stackTrace' : errorMsg;
    _log('ERROR', fullMsg);
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
    final logEntry = '[$timestamp] $level: $message';
    print(logEntry);
    _outputHandler?.call(logEntry);
  }
}
