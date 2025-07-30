import 'dart:io';
import 'package:path/path.dart' as path;
import '../constants.dart';
import 'copy_utils.dart';

/// Utilities for working with pubspec.yaml files
class PubspecUtils {
  /// Update pubspec.yaml with project name and dependencies
  static Future<void> updatePubspec(
    String projectDir,
    String templateName,
    String projectName,
    bool verbose,
  ) async {
    final pubspecFile = File(path.join(projectDir, Constants.pubspecFileName));
    if (!pubspecFile.existsSync()) {
      if (verbose) {
        stdout.writeln('${Constants.errorMessage} pubspec.yaml not found');
      }
      return;
    }

    String content = await pubspecFile.readAsString();

    // Update project name
    content = content.replaceAll('name: base_kit_app', 'name: $projectName');

    // Update description
    content = content.replaceAll(
      'description: "A new Flutter project."',
      'description: "A Flutter project generated with Flutter Base Kit."',
    );

    // Write updated content first
    await pubspecFile.writeAsString(content);

    // Add flutter_base_kit dependency if not exists
    await _addFlutterBaseKitDependency(pubspecFile, verbose);

    if (verbose) {
      stdout.writeln('${Constants.updateMessage} Updated pubspec.yaml');
    }
  }

  /// Add or update flutter_base_kit dependency to pubspec.yaml
  static Future<void> _addFlutterBaseKitDependency(
    File pubspecFile,
    bool verbose,
  ) async {
    // Read current content
    String content = await pubspecFile.readAsString();

    // Get current package version
    final currentVersion = CopyUtils.getCurrentPackageVersion();
    if (currentVersion == null) {
      if (verbose) {
        stdout.writeln(
            '${Constants.errorMessage} Could not determine package version, using latest');
      }
    }

    final versionString =
        currentVersion != null ? '^$currentVersion' : '^1.1.1';

    // Find dependencies section and add/update flutter_base_kit from pub.dev
    final lines = content.split('\n');
    final dependenciesIndex =
        lines.indexWhere((line) => line.trim() == 'dependencies:');

    if (dependenciesIndex != -1) {
      // Check if flutter_base_kit dependency already exists
      final existingIndex = lines.indexWhere((line) =>
          line.trim().startsWith('${Constants.flutterBaseKitPackage}:'));

      if (existingIndex != -1) {
        // Update existing dependency
        lines[existingIndex] =
            '  ${Constants.flutterBaseKitPackage}: $versionString';
        if (verbose) {
          stdout.writeln(
              '${Constants.infoMessage} Updated flutter_base_kit dependency to version $versionString');
        }
      } else {
        // Add new dependency
        lines.insert(dependenciesIndex + 1,
            '  ${Constants.flutterBaseKitPackage}: $versionString');
        if (verbose) {
          stdout.writeln(
              '${Constants.infoMessage} Added flutter_base_kit dependency from pub.dev (version $versionString)');
        }
      }

      await pubspecFile.writeAsString(lines.join('\n'));
    }
  }

  /// Update app pubspec.yaml with dependencies and configuration
  static Future<void> updateAppPubspec(
    String appDir,
    String appName,
    bool verbose,
  ) async {
    final pubspecFile = File(path.join(appDir, Constants.pubspecFileName));
    if (!pubspecFile.existsSync()) {
      if (verbose) {
        stdout
            .writeln('${Constants.errorMessage} pubspec.yaml not found in app');
      }
      return;
    }

    String content = await pubspecFile.readAsString();

    // Replace the entire content with our template content
    final root = CopyUtils.findTemplatePath();
    final templatePath = path.join(root, 'templates',
        Constants.baseKitAppTemplate, Constants.pubspecFileName);
    final templateFile = File(templatePath);

    if (templateFile.existsSync()) {
      content = await templateFile.readAsString();
      // Update project name
      content = content.replaceAll('name: base_kit_app', 'name: $appName');
      // Update description
      content = content.replaceAll(
        'description: "Flutter app template with base structure"',
        'description: "A Flutter app generated with Flutter Base Kit."',
      );
    }

    await pubspecFile.writeAsString(content);
    if (verbose) {
      stdout.writeln('${Constants.updateMessage} Updated app pubspec.yaml');
    }
  }

  /// Update package pubspec.yaml with dependencies and configuration
  static Future<void> updatePackagePubspec(
    String packageDir,
    String packageName,
    bool verbose,
  ) async {
    final pubspecFile = File(path.join(packageDir, Constants.pubspecFileName));
    if (!pubspecFile.existsSync()) {
      if (verbose) {
        stdout.writeln(
            '${Constants.errorMessage} pubspec.yaml not found in package');
      }
      return;
    }

    String content = await pubspecFile.readAsString();

    // Replace the entire content with our template content
    final root = CopyUtils.findTemplatePath();
    final templatePath = path.join(root, 'templates',
        Constants.baseKitPackageTemplate, Constants.pubspecFileName);
    final templateFile = File(templatePath);

    if (templateFile.existsSync()) {
      content = await templateFile.readAsString();
      // Update project name
      content =
          content.replaceAll('name: base_kit_package', 'name: $packageName');
    }

    await pubspecFile.writeAsString(content);
    if (verbose) {
      stdout.writeln('${Constants.updateMessage} Updated package pubspec.yaml');
    }

    // Update main library file
    await _updatePackageMainFile(packageDir, packageName, verbose);

    // Remove default test directory
    await _removeDefaultTestDirectory(packageDir, verbose);

    // Update analysis_options.yaml
    await _updatePackageAnalysisOptions(packageDir, verbose);
  }

  /// Update tester pubspec.yaml to include package dependency
  static Future<void> updateTesterPubspec(
    String testerDir,
    String testerName,
    String packageName,
    bool verbose,
  ) async {
    final pubspecFile = File(path.join(testerDir, Constants.pubspecFileName));
    if (!pubspecFile.existsSync()) {
      if (verbose) {
        stdout.writeln(
            '${Constants.errorMessage} pubspec.yaml not found in tester');
      }
      return;
    }

    // Replace the entire content with our template content
    final root = CopyUtils.findTemplatePath();
    final templatePath = path.join(root, 'templates',
        Constants.baseKitTesterTemplate, Constants.pubspecFileName);
    final templateFile = File(templatePath);

    String content;
    if (templateFile.existsSync()) {
      content = await templateFile.readAsString();
      // Update project name
      content =
          content.replaceAll('name: base_kit_tester', 'name: $testerName');
      // Update package dependency
      content = content.replaceAll('base_kit_package:', '$packageName:');
      content = content.replaceAll(
          'path: ../base_kit_package', 'path: ../$packageName');
    } else {
      // Fallback to original content if template not found
      content = await pubspecFile.readAsString();
      content =
          content.replaceAll('name: base_kit_tester', 'name: $testerName');

      // Add package dependency if it doesn't exist
      if (!content.contains('$packageName:')) {
        final lines = content.split('\n');
        final dependenciesIndex =
            lines.indexWhere((line) => line.trim() == 'dependencies:');

        if (dependenciesIndex != -1) {
          // Add package dependency after flutter dependency
          final flutterIndex = lines.indexWhere(
              (line) => line.trim().startsWith('flutter:'), dependenciesIndex);

          if (flutterIndex != -1) {
            lines.insert(flutterIndex + 1, '  $packageName:');
            lines.insert(flutterIndex + 2, '    path: ../$packageName');
          } else {
            // If flutter dependency not found, add after dependencies:
            lines.insert(dependenciesIndex + 1, '  $packageName:');
            lines.insert(dependenciesIndex + 2, '    path: ../$packageName');
          }

          content = lines.join('\n');
        }
      }
    }

    await pubspecFile.writeAsString(content);
    if (verbose) {
      stdout.writeln('${Constants.updateMessage} Updated tester pubspec.yaml');
    }
  }

  /// Update package main library file with exports
  static Future<void> _updatePackageMainFile(
    String packageDir,
    String packageName,
    bool verbose,
  ) async {
    final mainFile = File(path.join(packageDir, 'lib', '$packageName.dart'));
    if (!mainFile.existsSync()) {
      if (verbose) {
        stdout.writeln('${Constants.errorMessage} Main library file not found');
      }
      return;
    }

    // Create library content with exports
    final content = '''library;

export 'src/app_loader.dart';
''';

    await mainFile.writeAsString(content);
    if (verbose) {
      stdout.writeln('${Constants.updateMessage} Updated main library file');
    }
  }

  /// Remove default test directory created by flutter create
  static Future<void> _removeDefaultTestDirectory(
    String packageDir,
    bool verbose,
  ) async {
    final testDir = Directory(path.join(packageDir, 'test'));
    if (testDir.existsSync()) {
      await testDir.delete(recursive: true);
      if (verbose) {
        stdout.writeln(
            '${Constants.updateMessage} Removed default test directory');
      }
    }
  }

  /// Update package analysis_options.yaml with template content
  static Future<void> _updatePackageAnalysisOptions(
    String packageDir,
    bool verbose,
  ) async {
    final analysisFile = File(path.join(packageDir, 'analysis_options.yaml'));
    if (!analysisFile.existsSync()) {
      if (verbose) {
        stdout.writeln(
            '${Constants.errorMessage} analysis_options.yaml not found');
      }
      return;
    }

    // Replace with template content
    final root = CopyUtils.findTemplatePath();
    final templatePath = path.join(root, 'templates',
        Constants.baseKitPackageTemplate, 'analysis_options.yaml');
    final templateFile = File(templatePath);

    if (templateFile.existsSync()) {
      final content = await templateFile.readAsString();
      await analysisFile.writeAsString(content);
      if (verbose) {
        stdout.writeln(
            '${Constants.updateMessage} Updated analysis_options.yaml');
      }
    }
  }
}
