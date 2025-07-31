import 'package:flutter/material.dart';

import 'colors_set_model.dart';

/// Global color management system for Flutter Base Kit
///
/// Provides centralized access to application colors and themes.
/// Colors can be customized globally by setting a custom [ColorsSetModel].
///
/// Features:
/// - Primary and secondary color access
/// - Background and text color management
/// - Icon color management
/// - Predefined color palette
/// - Gradient support
/// - Dynamic color scheme switching
///
/// Usage:
/// ```dart
/// // Access colors
/// Container(
///   color: ColorsSet.primary,
///   child: Text(
///     'Hello',
///     style: TextStyle(color: ColorsSet.text),
///   ),
/// )
///
/// // Customize colors globally
/// ColorsSet.setColors(CustomColorsSet());
///
/// // Use gradients
/// Container(
///   decoration: BoxDecoration(
///     gradient: ColorsSet.gradient,
///   ),
/// )
/// ```
abstract class ColorsSet {
  static var _colors = const ColorsSetModel();

  /// Primary brand color
  static Color get primary => _colors.primary;

  /// Secondary brand color
  static Color get secondary => _colors.secondary;

  /// Main background color
  static Color get background => _colors.background;

  /// Primary text color
  static Color get text => _colors.text;

  /// Primary icon color
  static Color get icon => _colors.icon;

  /// Additional background color
  static Color get colorBackground => _colors.colorBackground;

  /// Additional icon color
  static Color get colorIcon => _colors.colorIcon;

  /// White color constant
  static Color get colorWhite => _colors.colorWhite;

  /// Black color constant
  static Color get colorBlack => _colors.colorBlack;

  /// Purple accent color
  static Color get colorPurple => _colors.colorPurple;

  /// Error color from color scheme
  static Color get colorSchemeError => _colors.colorSchemeError;

  /// Primary color from color scheme
  static Color get colorSchemePrimary => _colors.colorSchemePrimary;

  /// Application gradient
  static Gradient get gradient => _colors.gradient;

  /// Sets the global color scheme
  ///
  /// [colors] - Custom color set model to use globally
  static void setColors(ColorsSetModel colors) => _colors = colors;
}
