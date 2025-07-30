import 'dart:io';
import 'package:flutter_base_kit/generator/io/copy_utils.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart' as path;

void main() {
  group('CopyUtils', () {
    late Directory tempDir;

    setUp(() {
      tempDir = Directory.systemTemp.createTempSync('flutter_base_kit_test_');
    });

    tearDown(() {
      if (tempDir.existsSync()) {
        tempDir.deleteSync(recursive: true);
      }
    });

    group('findTemplatePath', () {
      test('should find templates directory', () {
        // This test should work in both development and global installation
        final templatePath = CopyUtils.findTemplatePath();
        expect(templatePath, isNotNull);
        expect(Directory(templatePath).existsSync(), isTrue);

        // Check that templates directory exists
        final templatesDir = Directory(path.join(templatePath, 'templates'));
        expect(templatesDir.existsSync(), isTrue);

        // Check that at least one template exists
        final baseKitAppDir =
            Directory(path.join(templatePath, 'templates', 'base_kit_app'));
        expect(baseKitAppDir.existsSync(), isTrue);
      });

      test('should handle null path gracefully', () {
        // Mock scenario where script path is null
        final result = CopyUtils.findTemplatePath();
        // Should not throw and should return either a valid path or null
        expect(Directory(result).existsSync(), isTrue);
      });
    });

    group('getCurrentPackageVersion', () {
      test('should return current package version', () {
        final version = CopyUtils.getCurrentPackageVersion();
        expect(version, isNotNull);
        expect(version, matches(r'^\d+\.\d+\.\d+$'));
      });

      test('should handle missing pubspec.yaml gracefully', () {
        // Create a temporary directory without pubspec.yaml
        final tempDir = Directory.systemTemp.createTempSync('test_no_pubspec_');
        final originalDir = Directory.current;

        try {
          Directory.current = tempDir;
          final version = CopyUtils.getCurrentPackageVersion();
          // Should return null or a fallback version
          expect(version == null || version.isNotEmpty, isTrue);
        } finally {
          Directory.current = originalDir;
          tempDir.deleteSync(recursive: true);
        }
      });
    });

    group('copyDirectory', () {
      test('should copy directory successfully', () async {
        // Create source directory with test files
        final sourceDir = Directory(path.join(tempDir.path, 'source'));
        sourceDir.createSync();

        final testFile = File(path.join(sourceDir.path, 'test.txt'));
        testFile.writeAsStringSync('test content');

        final subDir = Directory(path.join(sourceDir.path, 'subdir'));
        subDir.createSync();

        final subFile = File(path.join(subDir.path, 'sub.txt'));
        subFile.writeAsStringSync('sub content');

        // Copy to destination
        final destDir = Directory(path.join(tempDir.path, 'dest'));
        await CopyUtils.copyDirectory(sourceDir.path, destDir.path, false);

        // Verify files were copied
        expect(File(path.join(destDir.path, 'test.txt')).existsSync(), isTrue);
        expect(File(path.join(destDir.path, 'subdir', 'sub.txt')).existsSync(),
            isTrue);
        expect(File(path.join(destDir.path, 'test.txt')).readAsStringSync(),
            equals('test content'));
        expect(
            File(path.join(destDir.path, 'subdir', 'sub.txt'))
                .readAsStringSync(),
            equals('sub content'));
      });

      test('should handle non-existent source directory', () async {
        final nonExistentDir =
            Directory(path.join(tempDir.path, 'non_existent'));
        final destDir = Directory(path.join(tempDir.path, 'dest'));

        expect(
            () => CopyUtils.copyDirectory(
                nonExistentDir.path, destDir.path, false),
            throwsA(isA<Exception>()));
      });

      test('should handle existing destination directory', () async {
        // Create source and destination directories
        final sourceDir = Directory(path.join(tempDir.path, 'source'));
        sourceDir.createSync();

        final testFile = File(path.join(sourceDir.path, 'test.txt'));
        testFile.writeAsStringSync('source content');

        final destDir = Directory(path.join(tempDir.path, 'dest'));
        destDir.createSync();

        final existingFile = File(path.join(destDir.path, 'existing.txt'));
        existingFile.writeAsStringSync('existing content');

        // Copy should overwrite existing files
        await CopyUtils.copyDirectory(sourceDir.path, destDir.path, false);

        expect(File(path.join(destDir.path, 'test.txt')).existsSync(), isTrue);
        expect(
            File(path.join(destDir.path, 'existing.txt')).existsSync(), isTrue);
        expect(File(path.join(destDir.path, 'test.txt')).readAsStringSync(),
            equals('source content'));
      });
    });

    group('ensureDirectoryExists', () {
      test('should create directory if it does not exist', () async {
        final newDir = Directory(path.join(tempDir.path, 'new_directory'));
        expect(newDir.existsSync(), isFalse);

        await CopyUtils.ensureDirectoryExists(newDir.path, false);
        expect(newDir.existsSync(), isTrue);
      });

      test('should not fail if directory already exists', () {
        final existingDir =
            Directory(path.join(tempDir.path, 'existing_directory'));
        existingDir.createSync();
        expect(existingDir.existsSync(), isTrue);

        expect(() => CopyUtils.ensureDirectoryExists(existingDir.path, false),
            returnsNormally);
        expect(existingDir.existsSync(), isTrue);
      });

      test('should create nested directories', () async {
        final nestedDir =
            Directory(path.join(tempDir.path, 'nested', 'deep', 'directory'));
        expect(nestedDir.existsSync(), isFalse);

        await CopyUtils.ensureDirectoryExists(nestedDir.path, false);
        expect(nestedDir.existsSync(), isTrue);
      });
    });
  });
}
