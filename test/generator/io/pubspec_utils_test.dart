import 'dart:io';
import 'package:flutter_base_kit/generator/io/pubspec_utils.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart' as path;

void main() {
  group('PubspecUtils', () {
    late Directory tempDir;
    late File pubspecFile;

    setUp(() {
      tempDir = Directory.systemTemp.createTempSync('flutter_base_kit_test_');
      pubspecFile = File(path.join(tempDir.path, 'pubspec.yaml'));
    });

    tearDown(() {
      if (tempDir.existsSync()) {
        tempDir.deleteSync(recursive: true);
      }
    });

    group('updatePubspec', () {
      test('should add flutter_base_kit dependency if not exists', () async {
        // Create a basic pubspec.yaml without flutter_base_kit
        pubspecFile.writeAsStringSync('''
name: test_app
description: A test app
version: 1.0.0

environment:
  sdk: '>=3.0.0 <4.0.0'

dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.2

dev_dependencies:
  flutter_test:
    sdk: flutter
''');

        await PubspecUtils.updatePubspec(
            tempDir.path, 'test_app', 'com.test', false);

        final content = await pubspecFile.readAsString();
        expect(content, contains('flutter_base_kit:'));
        expect(content, contains('name: test_app'));
        expect(content, contains('description: A test app'));
      });

      test('should update existing flutter_base_kit dependency', () async {
        // Create a pubspec.yaml with old flutter_base_kit version
        pubspecFile.writeAsStringSync('''
name: test_app
description: A test app
version: 1.0.0

environment:
  sdk: '>=3.0.0 <4.0.0'

dependencies:
  flutter:
    sdk: flutter
  flutter_base_kit: ^1.0.0
  cupertino_icons: ^1.0.2

dev_dependencies:
  flutter_test:
    sdk: flutter
''');

        await PubspecUtils.updatePubspec(
            tempDir.path, 'test_app', 'com.test', false);

        final content = await pubspecFile.readAsString();
        // Should update to current version (1.1.4)
        expect(content, contains('flutter_base_kit: ^1.1.4'));
      });

      test('should handle missing pubspec.yaml', () async {
        // Create a directory without pubspec.yaml
        final emptyDir = Directory.systemTemp.createTempSync('empty_test_');
        expect(
            () => PubspecUtils.updatePubspec(
                emptyDir.path, 'test_app', 'com.test', false),
            returnsNormally);
        emptyDir.deleteSync(recursive: true);
      });

      test('should update organization in Android package name', () async {
        pubspecFile.writeAsStringSync('''
name: test_app
description: A test app
version: 1.0.0

environment:
  sdk: '>=3.0.0 <4.0.0'

dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.2

dev_dependencies:
  flutter_test:
    sdk: flutter
''');

        await PubspecUtils.updatePubspec(
            tempDir.path, 'test_app', 'com.mycompany', false);

        final content = await pubspecFile.readAsString();
        expect(content, contains('name: test_app'));
        // Should add flutter_base_kit dependency
        expect(content, contains('flutter_base_kit:'));
      });
    });

    group('updateTesterPubspec', () {
      test('should update tester pubspec with path dependency', () async {
        pubspecFile.writeAsStringSync('''
name: base_kit_tester
description: A test app
version: 1.0.0

environment:
  sdk: '>=3.0.0 <4.0.0'

dependencies:
  flutter:
    sdk: flutter
  base_kit_package:
    path: ../base_kit_package
  cupertino_icons: ^1.0.2

dev_dependencies:
  flutter_test:
    sdk: flutter
''');

        await PubspecUtils.updateTesterPubspec(
            tempDir.path, 'test_app_tester', 'test_package', false);

        final content = await pubspecFile.readAsString();
        expect(content, contains('test_package:'));
        expect(content, contains('path: ../test_package'));
      });

      test('should handle existing path dependency', () async {
        pubspecFile.writeAsStringSync('''
name: base_kit_tester
description: A test app
version: 1.0.0

environment:
  sdk: '>=3.0.0 <4.0.0'

dependencies:
  flutter:
    sdk: flutter
  base_kit_package:
    path: ../base_kit_package
  cupertino_icons: ^1.0.2

dev_dependencies:
  flutter_test:
    sdk: flutter
''');

        await PubspecUtils.updateTesterPubspec(
            tempDir.path, 'test_app_tester', 'test_package', false);

        final content = await pubspecFile.readAsString();
        expect(content, contains('test_package:'));
        expect(content, contains('path: ../test_package'));
        expect(content, isNot(contains('path: ../old_package')));
      });
    });
  });
}
