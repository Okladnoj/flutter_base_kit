// test/string_case_test.dart
import 'package:flutter_test/flutter_test.dart';

/// Utility to convert snake_case to lowerCamelCase.
class StringCase {
  /// Converts snake_case (and simple names) to lowerCamelCase.
  /// - Keeps the first segment lowercased.
  /// - Capitalizes the first letter of each subsequent segment.
  /// - Ignores empty segments caused by consecutive/edge underscores.
  static String toCamelCase(String newName) {
    if (newName.isEmpty) return newName;

    // Handle snake_case and simple names
    final words = newName.split('_').where((word) => word.isNotEmpty);

    final wordsList = words.toList();
    if (wordsList.isEmpty) return newName;

    final first = wordsList.first.toLowerCase();
    final rest = wordsList.skip(1).map((word) {
      final lower = word.toLowerCase();
      return lower[0].toUpperCase() + lower.substring(1);
    }).join('');

    return first + rest;
  }
}

void main() {
  group('StringCase.toCamelCase', () {
    test('returns empty string as is', () {
      expect(StringCase.toCamelCase(''), '');
    });

    test('single word lower -> lower', () {
      expect(StringCase.toCamelCase('hello'), 'hello');
    });

    test('single word upper -> lower', () {
      expect(StringCase.toCamelCase('HELLO'), 'hello');
    });

    test('single word mixed -> lower', () {
      expect(StringCase.toCamelCase('HeLLo'), 'hello');
    });

    test('snake_case basic', () {
      expect(StringCase.toCamelCase('hello_world'), 'helloWorld');
    });

    test('multiple segments', () {
      expect(StringCase.toCamelCase('make_http_request_now'),
          'makeHttpRequestNow');
    });

    test('handles consecutive underscores', () {
      expect(StringCase.toCamelCase('hello__world___again'), 'helloWorldAgain');
    });

    test('leading and trailing underscores are ignored', () {
      expect(StringCase.toCamelCase('_private_name_'), 'privateName');
    });

    test('digits preserved and segments capitalized after underscores', () {
      expect(StringCase.toCamelCase('version_2_release_candidate'),
          'version2ReleaseCandidate');
    });

    test('non-latin letters preserved with casing per code unit', () {
      expect(StringCase.toCamelCase('привет_мир'), 'приветМир');
    });

    test('already camelCase becomes fully lowercased (no underscores)', () {
      expect(StringCase.toCamelCase('helloWorld'), 'helloworld');
    });
  });
}
