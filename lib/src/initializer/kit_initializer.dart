import 'package:flutter/material.dart';

import '../../flutter_base_kit.dart';
import '../themes/colors_set.dart';
import '../themes/colors_set_model.dart';
import '../themes/strings_set.dart';
import '../themes/strings_set_model.dart';
import '../ui/loaders/app_loader.dart';

/// Main initializer for Flutter Base Kit
///
/// This class provides a centralized way to initialize all core components
/// of the Flutter Base Kit framework. It handles:
/// - Error handling setup
/// - Loading screen configuration
/// - Theme colors configuration
/// - Localization strings configuration
///
/// Usage:
/// ```dart
/// void main() async {
///   WidgetsFlutterBinding.ensureInitialized();
///
///   await KitInitializer.initialize(
///     errorHandler: (error) => print('Error: $error'),
///     loadPreset: CustomLoader(),
///     colors: CustomColorsSet(),
///     strings: CustomStringsSet(),
///   );
///
///   runApp(MyApp());
/// }
/// ```
abstract class KitInitializer {
  /// Initializes the Flutter Base Kit framework
  ///
  /// [errorHandler] - Optional callback function to handle global errors
  /// [loadPreset] - Custom loading widget to display during app initialization
  /// [colors] - Custom color scheme for the application
  /// [strings] - Custom localization strings for the application
  ///
  /// This method should be called before running the app to ensure
  /// all components are properly configured.
  static Future<void> initialize({
    void Function(BaseException)? errorHandler,
    Widget loadPreset = const AppDefaultLoader(),
    ColorsSetModel? colors,
    StringsSetModel? strings,
  }) async {
    if (errorHandler != null) BaseProvider.setErrorHandler(errorHandler);

    AppKitLoader.setLoadPreset(loadPreset);

    if (colors != null) ColorsSet.setColors(colors);
    if (strings != null) StringsSet.setStrings(strings);
  }
}
