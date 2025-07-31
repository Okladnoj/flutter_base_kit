import 'dart:ui';

/// Extensions for String class providing utility methods
///
/// Provides convenient methods for common string operations including:
/// - Color conversion from hex strings
/// - Text formatting (capitalize, title case)
/// - Validation (email, phone)
/// - Text manipulation (whitespace removal, truncation)
///
/// Usage:
/// ```dart
/// // Color conversion
/// final color = '#FF5733'.toColor;
///
/// // Text formatting
/// final title = 'hello world'.toTitleCase; // 'Hello World'
/// final cap = 'hello'.capitalize; // 'Hello'
///
/// // Validation
/// final isValidEmail = 'user@example.com'.isEmail; // true
/// final isValidPhone = '+1234567890'.isPhone; // true
///
/// // Text manipulation
/// final clean = '  hello  world  '.removeWhitespace; // 'helloworld'
/// final short = 'Very long text'.truncate(10); // 'Very long...'
/// ```
extension StringExt on String {
  /// Convert hex string to Color
  ///
  /// Supports both 6-digit (#RRGGBB) and 8-digit (#AARRGGBB) hex formats
  /// Returns null if the string is not a valid hex color
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

  /// Capitalize first letter of the string
  ///
  /// Returns the string with the first character in uppercase
  String get capitalize {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  /// Convert string to title case
  ///
  /// Capitalizes the first letter of each word in the string
  String get toTitleCase {
    if (isEmpty) return this;
    return split(' ').map((word) => word.capitalize).join(' ');
  }

  /// Check if string is a valid email address
  ///
  /// Uses regex pattern to validate email format
  bool get isEmail {
    return RegExp(
      r'^[a-zA-Z0-9._\+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    ).hasMatch(this);
  }

  /// Check if string is a valid phone number
  ///
  /// Supports international format with optional + prefix
  bool get isPhone {
    return RegExp(r'^\+?[\d\s\-\(\)]{10,}$').hasMatch(this);
  }

  /// Remove all whitespace characters from the string
  ///
  /// Removes spaces, tabs, newlines, and other whitespace characters
  String get removeWhitespace {
    return replaceAll(RegExp(r'\s+'), '');
  }

  /// Truncate string to specified length with optional suffix
  ///
  /// [maxLength] - Maximum length of the resulting string
  /// [suffix] - Optional suffix to append when truncating (default: '...')
  ///
  /// Returns the original string if it's shorter than maxLength
  String truncate(int maxLength, {String suffix = '...'}) {
    if (length <= maxLength) return this;
    return '${substring(0, maxLength)}$suffix';
  }
}
