// Conditional import for logger - uses stub for web, full logger for native platforms
export 'logger_stub.dart' if (dart.library.io) 'logger_io.dart';
