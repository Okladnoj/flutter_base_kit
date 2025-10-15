import 'package:flutter/material.dart';

/// ANSI color parser for colored log output
class AnsiParser {
  static const _ansiEscapeRegex = r'\[([0-9]{1,3}(;[0-9]{1,3})*)m';

  /// Parse ANSI codes and return a list of TextSpans with colors
  static List<TextSpan> parseAnsi(String text, TextStyle baseStyle) {
    final spans = <TextSpan>[];
    final regex = RegExp(_ansiEscapeRegex);
    var lastIndex = 0;
    Color? currentColor;
    FontWeight? currentWeight;

    for (final match in regex.allMatches(text)) {
      // Add text before the ANSI code
      if (match.start > lastIndex) {
        final textBefore = text.substring(lastIndex, match.start);
        if (textBefore.isNotEmpty) {
          spans.add(
            TextSpan(
              text: textBefore,
              style: baseStyle.copyWith(
                color: currentColor,
                fontWeight: currentWeight,
              ),
            ),
          );
        }
      }

      // Parse ANSI code
      final code = match.group(1);
      if (code != null) {
        final codes = code.split(';').map(int.tryParse).whereType<int>();
        for (final c in codes) {
          switch (c) {
            case 0: // Reset
              currentColor = null;
              currentWeight = null;
              break;
            case 1: // Bold
              currentWeight = FontWeight.bold;
              break;
            case 30: // Black
              currentColor = Colors.black;
              break;
            case 31: // Red
              currentColor = Colors.red;
              break;
            case 32: // Green
              currentColor = Colors.green;
              break;
            case 33: // Yellow
              currentColor = Colors.yellow.shade700;
              break;
            case 34: // Blue
              currentColor = Colors.blue;
              break;
            case 35: // Magenta
              currentColor = Colors.purple;
              break;
            case 36: // Cyan
              currentColor = Colors.cyan;
              break;
            case 37: // White
              currentColor = Colors.white;
              break;
            case 38: // Extended color (256 colors or RGB)
              final codesList = codes.toList();
              final currentIndex = codesList.indexOf(c);
              if (currentIndex >= 0 &&
                  currentIndex + 2 < codesList.length &&
                  codesList[currentIndex + 1] == 5) {
                // 256 color mode
                final colorCode = codesList[currentIndex + 2];
                currentColor = _get256Color(colorCode);
              }
              break;
            case 90: // Bright Black (Gray)
              currentColor = Colors.grey;
              break;
            case 91: // Bright Red
              currentColor = Colors.red.shade300;
              break;
            case 92: // Bright Green
              currentColor = Colors.green.shade300;
              break;
            case 93: // Bright Yellow
              currentColor = Colors.yellow.shade300;
              break;
            case 94: // Bright Blue
              currentColor = Colors.blue.shade300;
              break;
            case 95: // Bright Magenta
              currentColor = Colors.purple.shade300;
              break;
            case 96: // Bright Cyan
              currentColor = Colors.cyan.shade300;
              break;
            case 97: // Bright White
              currentColor = Colors.white;
              break;
          }
        }
      }

      lastIndex = match.end;
    }

    // Add remaining text
    if (lastIndex < text.length) {
      final remainingText = text.substring(lastIndex);
      if (remainingText.isNotEmpty) {
        spans.add(
          TextSpan(
            text: remainingText,
            style: baseStyle.copyWith(
              color: currentColor,
              fontWeight: currentWeight,
            ),
          ),
        );
      }
    }

    // If no ANSI codes found, return the original text
    if (spans.isEmpty) {
      spans.add(TextSpan(text: text, style: baseStyle));
    }

    return spans;
  }

  /// Convert 256 color code to Flutter Color
  static Color _get256Color(int code) {
    if (code < 16) {
      // Standard colors (0-15)
      return _getStandardColor(code);
    } else if (code < 232) {
      // 216 color cube (16-231)
      final index = code - 16;
      final r = (index ~/ 36) * 51;
      final g = ((index % 36) ~/ 6) * 51;
      final b = (index % 6) * 51;
      return Color.fromRGBO(r, g, b, 1.0);
    } else {
      // Grayscale (232-255)
      final gray = 8 + (code - 232) * 10;
      return Color.fromRGBO(gray, gray, gray, 1.0);
    }
  }

  static Color _getStandardColor(int code) {
    switch (code) {
      case 0:
        return Colors.black;
      case 1:
        return Colors.red.shade800;
      case 2:
        return Colors.green.shade800;
      case 3:
        return Colors.yellow.shade800;
      case 4:
        return Colors.blue.shade800;
      case 5:
        return Colors.purple.shade800;
      case 6:
        return Colors.cyan.shade800;
      case 7:
        return Colors.grey.shade300;
      case 8:
        return Colors.grey.shade700;
      case 9:
        return Colors.red;
      case 10:
        return Colors.green;
      case 11:
        return Colors.yellow;
      case 12:
        return Colors.blue;
      case 13:
        return Colors.purple;
      case 14:
        return Colors.cyan;
      case 15:
        return Colors.white;
      default:
        return Colors.white;
    }
  }
}
