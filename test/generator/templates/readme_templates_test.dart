import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_base_kit/generator/templates/readme_templates.dart';

void main() {
  group('ReadmeTemplates', () {
    test('should generate app readme template', () {
      final projectName = 'test_app';
      final readme = ReadmeTemplates.appReadme(projectName);

      expect(readme, contains(projectName));
      expect(readme, contains('Flutter'));
      expect(readme, contains('## Getting Started'));
      expect(readme, contains('flutter pub get'));
      expect(readme, contains('flutter run'));
    });

    test('should generate package readme template', () {
      final projectName = 'test_package';
      final readme = ReadmeTemplates.packageReadme(projectName);

      expect(readme, contains(projectName));
      expect(readme, contains('Flutter package'));
      expect(readme, contains('## Getting Started'));
      expect(readme, contains('flutter pub get'));
      expect(readme, contains('flutter test'));
    });

    test('should generate tester readme template', () {
      final projectName = 'test_package';
      final testerName = '${projectName}_tester';
      final readme = ReadmeTemplates.testerReadme(testerName, projectName);

      expect(readme, contains(testerName));
      expect(readme, contains(projectName));
      expect(readme, contains('test'));
      expect(readme, contains('flutter pub get'));
      expect(readme, contains('flutter run'));
    });

    test('should include proper formatting in app readme', () {
      final projectName = 'my_app';
      final readme = ReadmeTemplates.appReadme(projectName);

      expect(readme, startsWith('# $projectName'));
      expect(readme, contains('## Getting Started'));
      expect(readme, contains('flutter pub get'));
      expect(readme, contains('flutter run'));
      expect(readme, contains('Flutter Base Kit'));
    });

    test('should include proper formatting in package readme', () {
      final projectName = 'my_package';
      final readme = ReadmeTemplates.packageReadme(projectName);

      expect(readme, startsWith('# $projectName'));
      expect(readme, contains('## Getting Started'));
      expect(readme, contains('flutter pub get'));
      expect(readme, contains('flutter test'));
      expect(readme, contains('Flutter Base Kit'));
    });

    test('should include proper formatting in tester readme', () {
      final projectName = 'my_package';
      final testerName = '${projectName}_tester';
      final readme = ReadmeTemplates.testerReadme(testerName, projectName);

      expect(readme, startsWith('# $testerName'));
      expect(readme, contains('## Getting Started'));
      expect(readme, contains('flutter pub get'));
      expect(readme, contains('flutter run'));
      expect(readme, contains(projectName));
    });
  });
}
