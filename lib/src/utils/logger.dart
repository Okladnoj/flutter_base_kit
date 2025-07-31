/// Cross-platform logger for Flutter Base Kit
///
/// Provides a unified logging interface that works across all platforms:
/// - **Web (WASM)**: Uses simplified logger with print() statements
/// - **Native (Android, iOS, Desktop)**: Uses full logger package functionality
///
/// The logger automatically selects the appropriate implementation based on
/// the platform using conditional compilation.
///
/// Available methods:
/// - [loggerApp.i()] - Info logging
/// - [loggerApp.d()] - Debug logging
/// - [loggerApp.w()] - Warning logging
/// - [loggerApp.e()] - Error logging
/// - [loggerApp.f()] - Fatal logging
/// - [loggerApp.t()] - Trace logging
///
/// Usage:
/// ```dart
/// import 'package:flutter_base_kit/flutter_base_kit.dart';
///
/// loggerApp.i('Application started');
/// loggerApp.d('Debug information');
/// loggerApp.e('Error occurred', error: exception, stackTrace: stack);
/// ```
library;

// Conditional import for logger - uses stub for web, full logger for native platforms
export 'logger_stub.dart' if (dart.library.io) 'logger_io.dart';
