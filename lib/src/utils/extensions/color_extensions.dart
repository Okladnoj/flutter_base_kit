import 'package:flutter/material.dart';

/// Extensions for Color class
extension ColorExt on Color {
  /// Convert Color to hex string
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
  Color darken([double amount = 0.1]) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(this);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));
    return hslDark.toColor();
  }

  /// Create a lighter version of the color
  Color lighten([double amount = 0.1]) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(this);
    final hslLight = hsl.withLightness(
      (hsl.lightness + amount).clamp(0.0, 1.0),
    );
    return hslLight.toColor();
  }

  /// Check if color is dark
  bool get isDark {
    final luminance = computeLuminance();
    return luminance < 0.5;
  }

  /// Check if color is light
  bool get isLight {
    return !isDark;
  }

  /// Get contrasting color (black or white)
  Color get contrastingColor {
    return isDark ? const Color(0xFFFFFFFF) : const Color(0xFF000000);
  }
}
