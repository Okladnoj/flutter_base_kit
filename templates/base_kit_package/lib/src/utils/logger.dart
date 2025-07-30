import 'package:logger/logger.dart';

import '../config/constants/app_constants.dart';

final loggerApp = _Logger();

class _Logger {
  final l = 100;
  void i(dynamic message) {
    Logger(
      printer: PrettyPrinter(lineLength: l, methodCount: 0),
      filter: _Filter(),
    ).i(message);
  }

  void d(dynamic message) {
    Logger(
      printer: PrettyPrinter(lineLength: l, methodCount: 2),
      filter: _Filter(),
    ).d(message);
  }

  void w(dynamic message) {
    Logger(printer: PrettyPrinter(lineLength: l), filter: _Filter()).w(message);
  }

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

  void f(dynamic message) {
    Logger(printer: PrettyPrinter(lineLength: l), filter: _Filter()).f(message);
  }

  void t(dynamic message) {
    Logger(printer: PrettyPrinter(lineLength: l), filter: _Filter()).t(message);
  }

  void log(Level level, dynamic message) {
    Logger(
      printer: PrettyPrinter(lineLength: l),
      filter: _Filter(),
    ).log(level, message);
  }
}

class _Filter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) => AppConstants.isLogsOn;
}
