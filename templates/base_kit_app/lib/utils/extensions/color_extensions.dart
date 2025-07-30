import 'dart:ui';

extension ColorExt on Color {
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
}
