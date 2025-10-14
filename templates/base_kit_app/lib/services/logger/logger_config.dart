import 'package:flutter_base_kit/flutter_base_kit.dart';

import 'logger_config_io.dart' if (dart.library.html) 'logger_config_web.dart';

/// Configure logger output based on platform
///
/// - Native: Writes logs to file in cache directory
/// - Web: Stores logs in LocalStorage with rotation
Future<void> configureLogger() async {
  await configurePlatformLogger();
  loggerApp.i('Logger configured successfully');
}

/// Disable logger output
void disableLogger() {
  loggerApp.setOutputHandler(null);
  loggerApp.i('Logger output disabled');
}
