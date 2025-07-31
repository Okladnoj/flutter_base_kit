import 'package:flutter/material.dart';

/// Extensions for Color class providing utility methods
///
/// Provides convenient methods for color manipulation including:
/// - Hex string conversion
/// - Color modification (darken, lighten)
/// - Color analysis (dark/light detection)
/// - Contrast color generation
///
/// Usage:
/// ```dart
/// // Hex conversion
/// final hex = Colors.blue.toHex; // '#2196F3'
///
/// // Color modification
/// final darker = Colors.blue.darken(0.2);
/// final lighter = Colors.blue.lighten(0.2);
///
/// // Color analysis
/// final isDark = Colors.black.isDark; // true
/// final isLight = Colors.white.isLight; // true
///
/// // Contrast color
/// final contrast = Colors.blue.contrastingColor; // White or black
/// ```
extension ColorExt on Color {
  /// Convert Color to hex string
  ///
  /// Returns hex string in format #RRGGBB or #RRGGBBAA
  /// Returns null if conversion fails
  String? get toHex {
    var color = this;
    try {
      final a = (color.a * 255).toInt().toRadixString(16).padLeft(2, '0');
      final r = (color.r * 255).toInt().toRadixString(16).padLeft(2, '0');
      final g = (color.g * 255).toInt().toRadixString(16).padLeft(2, '0');
      final b = (color.b * 255).toInt().toRadixString(16).padLeft(2, '0');

      if (a == 'ff') return '#$r$g$b'.toUpperCase();

      return '#$r$g$b$a'.toUpperCase();
    } catch (_) {}
    return null;
  }

  /// Create a darker version of the color
  ///
  /// [amount] - Amount to darken (0.0 to 1.0, default: 0.1)
  ///
  /// Returns a new color with reduced lightness
  Color darken([double amount = 0.1]) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(this);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));
    return hslDark.toColor();
  }

  /// Create a lighter version of the color
  ///
  /// [amount] - Amount to lighten (0.0 to 1.0, default: 0.1)
  ///
  /// Returns a new color with increased lightness
  Color lighten([double amount = 0.1]) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(this);
    final hslLight = hsl.withLightness(
      (hsl.lightness + amount).clamp(0.0, 1.0),
    );
    return hslLight.toColor();
  }

  /// Check if color is dark based on luminance
  ///
  /// Returns true if the color's luminance is less than 0.5
  bool get isDark {
    final luminance = computeLuminance();
    return luminance < 0.5;
  }

  /// Check if color is light based on luminance
  ///
  /// Returns true if the color's luminance is 0.5 or greater
  bool get isLight {
    return !isDark;
  }

  /// Get contrasting color (black or white) for best readability
  ///
  /// Returns white for dark colors and black for light colors
  Color get contrastingColor {
    return isDark ? const Color(0xFFFFFFFF) : const Color(0xFF000000);
  }
}
