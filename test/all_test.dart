import 'package:flutter_test/flutter_test.dart';

import 'generator/io/copy_utils_test.dart' as copy_utils_test;
import 'generator/io/pubspec_utils_test.dart' as pubspec_utils_test;
import 'generator/constants_test.dart' as constants_test;
import 'generator/templates/readme_templates_test.dart'
    as readme_templates_test;

void main() {
  group('Flutter Base Kit - All Tests', () {
    copy_utils_test.main();

    pubspec_utils_test.main();

    constants_test.main();

    readme_templates_test.main();
  });
}
