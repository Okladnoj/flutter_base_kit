import 'dart:ui';

/// Extensions for String class
extension StringExt on String {
  /// Convert hex string to Color
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

  /// Capitalize first letter
  String get capitalize {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  /// Convert to title case
  String get toTitleCase {
    if (isEmpty) return this;
    return split(' ').map((word) => word.capitalize).join(' ');
  }

  /// Check if string is valid email
  bool get isEmail {
    return RegExp(
      r'^[a-zA-Z0-9._\+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    ).hasMatch(this);
  }

  /// Check if string is valid phone number
  bool get isPhone {
    return RegExp(r'^\+?[\d\s\-\(\)]{10,}$').hasMatch(this);
  }

  /// Remove all whitespace
  String get removeWhitespace {
    return replaceAll(RegExp(r'\s+'), '');
  }

  /// Truncate string to specified length
  String truncate(int maxLength, {String suffix = '...'}) {
    if (length <= maxLength) return this;
    return '${substring(0, maxLength)}$suffix';
  }
}
