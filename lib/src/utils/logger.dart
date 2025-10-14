/// Cross-platform logger for Flutter Base Kit
///
/// Provides a unified logging interface that works across all platforms:
/// - **Web (WASM)**: Uses simplified logger with print() statements
/// - **Native (Android, iOS, Desktop)**: Uses full logger package functionality
///
/// The logger automatically selects the appropriate implementation based on
/// the platform using conditional compilation.
///
/// ## Logging Methods:
/// - [loggerApp.i()] - Info logging
/// - [loggerApp.d()] - Debug logging
/// - [loggerApp.w()] - Warning logging
/// - [loggerApp.e()] - Error logging
/// - [loggerApp.f()] - Fatal logging
/// - [loggerApp.t()] - Trace logging
/// - [loggerApp.setOutputHandler()] - Set custom handler for all log messages
///
/// ## Basic Usage:
/// ```dart
/// import 'package:flutter_base_kit/flutter_base_kit.dart';
///
/// loggerApp.i('Application started');
/// loggerApp.d('Debug information');
/// loggerApp.e('Error occurred', error: exception, stackTrace: stack);
/// ```
///
/// ## Custom Output Handler:
/// You can set a custom handler to process all log messages.
///
/// **Important**: The handler receives the **exact same formatted output**
/// that appears in the debug console. This ensures consistency between
/// what you see in the console and what's saved to file/database.
///
/// ### Native Example (write to file):
/// ```dart
/// import 'dart:io';
/// import 'package:path_provider/path_provider.dart';
///
/// Future<void> configureFileLogging() async {
///   final appDocDir = await getApplicationCacheDirectory();
///   final logFile = File('${appDocDir.path}/app_logs.txt');
///
///   loggerApp.setOutputHandler((logMessage) {
///     // logMessage contains the same formatted output as console
///     logFile.writeAsStringSync('$logMessage\n', mode: FileMode.append);
///   });
/// }
/// ```
///
/// ### Web Example (write to LocalStorage):
/// ```dart
/// import 'dart:html' as html;
/// import 'dart:convert';
///
/// void configureWebLogging() {
///   final logs = <String>[];
///
///   loggerApp.setOutputHandler((logMessage) {
///     logs.add(logMessage);
///     // Keep only last 1000 entries
///     if (logs.length > 1000) logs.removeAt(0);
///     // Save to LocalStorage
///     html.window.localStorage['app_logs'] = jsonEncode(logs);
///   });
/// }
/// ```
library;

// Conditional import for logger - uses stub for web, full logger for native platforms
export 'logger_stub.dart' if (dart.library.io) 'logger_io.dart';
