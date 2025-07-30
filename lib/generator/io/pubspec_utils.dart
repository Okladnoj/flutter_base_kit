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
    content = content.replaceAll('name: $templateName', 'name: $projectName');

    // Update description
    content = content.replaceAll(
      'description: "A new Flutter project."',
      'description: "A Flutter project generated with Flutter Base Kit."',
    );

    // Add flutter_base_kit dependency if not exists
    await _addFlutterBaseKitDependency(content, pubspecFile, verbose);

    if (verbose) {
      stdout.writeln('${Constants.updateMessage} Updated pubspec.yaml');
    }
  }

  /// Add flutter_base_kit dependency to pubspec.yaml
  static Future<void> _addFlutterBaseKitDependency(
    String content,
    File pubspecFile,
    bool verbose,
  ) async {
    if (content.contains('${Constants.flutterBaseKitPackage}:')) {
      if (verbose) {
        stdout.writeln(
            '${Constants.infoMessage} flutter_base_kit dependency already exists');
      }
      return;
    }

    // Get current package version
    final currentVersion = CopyUtils.getCurrentPackageVersion();
    if (currentVersion == null) {
      if (verbose) {
        stdout.writeln(
            '${Constants.errorMessage} Could not determine package version, using latest');
      }
    }

    // Find dependencies section and add flutter_base_kit from pub.dev
    final lines = content.split('\n');
    final dependenciesIndex =
        lines.indexWhere((line) => line.trim() == 'dependencies:');

    if (dependenciesIndex != -1) {
      final versionString =
          currentVersion != null ? '^$currentVersion' : '^1.1.1';
      lines.insert(dependenciesIndex + 1,
          '  ${Constants.flutterBaseKitPackage}: $versionString');

      await pubspecFile.writeAsString(lines.join('\n'));
      if (verbose) {
        stdout.writeln(
            '${Constants.infoMessage} Added flutter_base_kit dependency from pub.dev (version $versionString)');
      }
    }
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

    String content = await pubspecFile.readAsString();

    // Update project name
    content = content.replaceAll('name: base_kit_tester', 'name: $testerName');

    // Update package dependency
    content = content.replaceAll(
      'base_kit_package:',
      '$packageName:',
    );
    content = content.replaceAll(
      'path: ../base_kit_package',
      'path: ../$packageName',
    );

    await pubspecFile.writeAsString(content);
    if (verbose) {
      stdout.writeln('${Constants.updateMessage} Updated tester pubspec.yaml');
    }
  }
}
