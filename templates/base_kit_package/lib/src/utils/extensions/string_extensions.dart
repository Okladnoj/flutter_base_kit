import 'dart:ui';

extension StringExt on String {
  Color? get toColor {
    var hex = this;
    try {
      hex = hex.replaceFirst('#', '');
      if (hex.length == 8) {
        final r = hex.substring(0, 2);
        final g = hex.substring(2, 4);
        final b = hex.substring(4, 6);
        final a = hex.substring(6, 8);
        return Color(int.parse('0x$a$r$g$b'));
      } else if (hex.length == 6) {
        return Color(int.parse('0xFF$hex'));
      }
    } catch (_) {}
    return null;
  }
}
