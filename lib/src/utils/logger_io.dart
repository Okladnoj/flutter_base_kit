import 'package:logger/logger.dart';

/// IO logger for native platforms (Android, iOS, Desktop)
/// This logger uses the logger package with full functionality

/// Global logger instance for the Flutter Base Kit
final loggerApp = _LoggerIO();

/// Custom logger class with full logger package functionality
class _LoggerIO {
  final l = 100;

  /// Log info message
  void i(dynamic message) {
    Logger(
      printer: PrettyPrinter(lineLength: l, methodCount: 0),
      filter: _Filter(),
    ).i(message);
  }

  /// Log debug message with stack trace
  void d(dynamic message) {
    Logger(
      printer: PrettyPrinter(lineLength: l, methodCount: 2),
      filter: _Filter(),
    ).d(message);
  }

  /// Log warning message
  void w(dynamic message) {
    Logger(printer: PrettyPrinter(lineLength: l), filter: _Filter()).w(message);
  }

  /// Log error message with optional error and stack trace
  void e(
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    Logger(
      printer: PrettyPrinter(lineLength: l),
      filter: _Filter(),
    ).e(message, error: error, stackTrace: stackTrace, time: time);
  }

  /// Log fatal message
  void f(dynamic message) {
    Logger(printer: PrettyPrinter(lineLength: l), filter: _Filter()).f(message);
  }

  /// Log trace message
  void t(dynamic message) {
    Logger(printer: PrettyPrinter(lineLength: l), filter: _Filter()).t(message);
  }

  /// Log with custom level
  void log(Level level, dynamic message) {
    Logger(
      printer: PrettyPrinter(lineLength: l),
      filter: _Filter(),
    ).log(level, message);
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
