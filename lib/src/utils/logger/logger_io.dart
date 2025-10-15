import 'package:logger/logger.dart';

/// IO logger for native platforms (Android, iOS, Desktop)
/// This logger uses the logger package with full functionality

/// Global logger instance for the Flutter Base Kit
final loggerApp = _LoggerIO();

/// Callback type for log output handler
typedef LogOutputHandler = void Function(String logMessage);

/// Custom LogOutput that forwards logs to a callback handler
class _CallbackOutput extends LogOutput {
  final LogOutputHandler handler;

  _CallbackOutput(this.handler);

  @override
  void output(OutputEvent event) {
    // Join all lines from the event into a single message
    final message = event.lines.join('\n');
    handler(message);
  }
}

/// Custom logger class with full logger package functionality
class _LoggerIO {
  final l = 100;
  LogOutputHandler? _outputHandler;
  Logger? _logger;
  Logger? _debugLogger;

  _LoggerIO() {
    _initLoggers();
  }

  void _initLoggers() {
    final outputs = <LogOutput>[ConsoleOutput()];
    if (_outputHandler != null) {
      outputs.add(_CallbackOutput(_outputHandler!));
    }

    _logger = Logger(
      printer: PrettyPrinter(lineLength: l, methodCount: 0),
      filter: _Filter(),
      output: MultiOutput(outputs),
    );

    _debugLogger = Logger(
      printer: PrettyPrinter(lineLength: l, methodCount: 2),
      filter: _Filter(),
      output: MultiOutput(outputs),
    );
  }

  /// Set custom output handler for logs
  ///
  /// The handler will receive the same formatted log messages that appear in console.
  /// You can use this to write logs to a file, database, or send to a server.
  ///
  /// Example:
  /// ```dart
  /// loggerApp.setOutputHandler((logMessage) {
  ///   final logFile = File('/path/to/logs.txt');
  ///   logFile.writeAsStringSync('$logMessage\n', mode: FileMode.append);
  /// });
  /// ```
  void setOutputHandler(LogOutputHandler? handler) {
    _outputHandler = handler;
    _initLoggers(); // Reinitialize loggers with new handler
  }

  /// Log info message
  void i(dynamic message) {
    _logger?.i(message);
  }

  /// Log debug message with stack trace
  void d(dynamic message) {
    _debugLogger?.d(message);
  }

  /// Log warning message
  void w(dynamic message) {
    _logger?.w(message);
  }

  /// Log error message with optional error and stack trace
  void e(
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    _logger?.e(message, error: error, stackTrace: stackTrace, time: time);
  }

  /// Log fatal message
  void f(dynamic message) {
    _logger?.f(message);
  }

  /// Log trace message
  void t(dynamic message) {
    _logger?.t(message);
  }

  /// Log with custom level
  void log(Level level, dynamic message) {
    _logger?.log(level, message);
  }
}

/// Custom log filter
class _Filter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    // You can customize this based on your needs
    // For example, check a global debug flag
    return true;
  }
}
