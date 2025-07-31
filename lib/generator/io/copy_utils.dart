import 'dart:io';
import 'package:path/path.dart' as path;
import '../constants.dart';

class CopyUtils {
  static Future<void> copyDirectory(
    String source,
    String destination,
    bool verbose,
  ) async {
    final src = Directory(source);
    await for (final entity in src.list(recursive: true, followLinks: false)) {
      final rel = path.relative(entity.path, from: source);
      final segments = path.split(rel);

      // Skip certain directories and files
      if (segments.first.startsWith('.git') ||
          segments.first == '.dart_tool' ||
          segments.first == 'build' ||
          segments.first == '.idea' ||
          segments.first == '.DS_Store') {
        continue;
      }

      final destPath = path.join(destination, rel);

      if (entity is File) {
        final destFile = File(destPath);
        await destFile.parent.create(recursive: true);
        await destFile.writeAsBytes(await entity.readAsBytes());
        if (verbose) {
          stdout.writeln('  ${Constants.fileMessage} $rel');
        }
      } else if (entity is Directory) {
        await Directory(destPath).create(recursive: true);
      }
    }
  }

  static String findTemplatePath() {
    // First check if we're in the source project directory
    final scriptDir = path.dirname(Platform.script.path);
    final possibleProjectRoot = path.dirname(scriptDir);

    // Check if templates exist in the possible root directory
    final templatesDir = path.join(possibleProjectRoot, 'templates');
    if (Directory(templatesDir).existsSync()) {
      return possibleProjectRoot;
    }

    // If not found, look in parent directory (for bin/ case)
    final parentDir = path.dirname(possibleProjectRoot);
    final parentTemplatesDir = path.join(parentDir, 'templates');
    if (Directory(parentTemplatesDir).existsSync()) {
      return parentDir;
    }

    // Check if we're running from a globally installed package
    // Look for the package in pub cache
    final pubCacheDir = path.join(
      Platform.environment['HOME'] ?? '',
      '.pub-cache',
      'hosted',
      'pub.dev',
    );

    if (Directory(pubCacheDir).existsSync()) {
      // Find flutter_base_kit package directory (latest version)
      final entries = Directory(pubCacheDir).listSync();
      String? latestVersionPath;
      String? latestVersion;

      for (final entry in entries) {
        if (entry is Directory && entry.path.contains('flutter_base_kit-')) {
          final globalTemplatesDir = path.join(entry.path, 'templates');
          if (Directory(globalTemplatesDir).existsSync()) {
            // Extract version from path
            final pathParts = entry.path.split('flutter_base_kit-');
            if (pathParts.length > 1) {
              final version = pathParts.last;
              if (latestVersion == null ||
                  _compareVersions(version, latestVersion) > 0) {
                latestVersion = version;
                latestVersionPath = entry.path;
              }
            }
          }
        }
      }

      if (latestVersionPath != null) {
        return latestVersionPath;
      }
    }

    // If still not found, return current directory
    return Directory.current.path;
  }

  static Future<void> ensureDirectoryExists(
      String dirPath, bool verbose) async {
    final dir = Directory(dirPath);
    if (!dir.existsSync()) {
      await dir.create(recursive: true);
      if (verbose) {
        stdout.writeln('📁 Created directory: $dirPath');
      }
    }
  }

  static int _compareVersions(String version1, String version2) {
    final parts1 = version1.split('.').map(int.parse).toList();
    final parts2 = version2.split('.').map(int.parse).toList();

    // Pad with zeros if needed
    while (parts1.length < parts2.length) {
      parts1.add(0);
    }
    while (parts2.length < parts1.length) {
      parts2.add(0);
    }

    for (int i = 0; i < parts1.length; i++) {
      if (parts1[i] > parts2[i]) return 1;
      if (parts1[i] < parts2[i]) return -1;
    }
    return 0;
  }

  static String? getCurrentPackageVersion() {
    try {
      // First try to find pubspec.yaml in the package directory (for global installation)
      final packageDir = findTemplatePath();
      final pubspecPath = path.join(packageDir, 'pubspec.yaml');

      // Debug: print the path we're checking
      stdout.writeln('🔍 Checking for pubspec.yaml at: $pubspecPath');

      final pubspecFile = File(pubspecPath);
      if (pubspecFile.existsSync()) {
        final content = pubspecFile.readAsStringSync();
        final versionMatch = RegExp(r'version:\s*([^\s]+)').firstMatch(content);
        if (versionMatch != null) {
          final version = versionMatch.group(1);
          stdout.writeln('✅ Found version: $version');
          return version;
        }
      }

      stdout.writeln('❌ Could not find version in pubspec.yaml');
      return null;
    } catch (e) {
      stdout.writeln('❌ Error getting version: $e');
      return null;
    }
  }
}
