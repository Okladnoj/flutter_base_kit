import 'dart:io';
import 'package:args/args.dart';
import 'package:path/path.dart' as path;
import '../../constants.dart';
import '../../io/copy_utils.dart';
import '../../io/pubspec_utils.dart';
import '../../templates/readme_templates.dart';

/// Command for creating new Flutter projects
class CreateCommand {
  /// Handle create command
  static Future<void> handle(ArgResults cmd) async {
    final verbose = cmd['verbose'] as bool;

    if (cmd.rest.isEmpty) {
      stderr.writeln('${Constants.errorMessage} Error: Project name required');
      exit(1);
    }

    final name = cmd.rest.first;
    final org = cmd['org'] as String?;
    final template = cmd['template'] as String;

    await _createProject(name, org, template, verbose);
  }

  /// Create project based on template type
  static Future<void> _createProject(
    String name,
    String? org,
    String template,
    bool verbose,
  ) async {
    stdout
      ..writeln('${Constants.createMessage} Creating Flutter project: $name')
      ..writeln('${Constants.infoMessage} Template: $template');

    if (org != null) {
      stdout.writeln('🏢 Organization: $org');
    }

    switch (template) {
      case Constants.appTemplate:
        await _createAppTemplate(name, org, verbose);
        break;
      case Constants.packageTemplate:
        await _createPackageTemplate(name, org, verbose);
        break;
      case Constants.packageWithTesterTemplate:
        await _createPackageWithTester(name, org, verbose);
        break;
      default:
        stderr.writeln(
            '${Constants.errorMessage} Error: Unknown template type: $template');
        exit(1);
    }
  }

  /// Create app template
  static Future<void> _createAppTemplate(
    String name,
    String? org,
    bool verbose,
  ) async {
    final packageDir = CopyUtils.findTemplatePath();
    final templateDir =
        path.join(packageDir, 'templates', Constants.baseKitAppTemplate);

    if (!Directory(templateDir).existsSync()) {
      stderr.writeln(
          '${Constants.errorMessage} Error: Template directory not found: $templateDir');
      exit(1);
    }

    final projectDir = path.join(Directory.current.path, name);
    if (Directory(projectDir).existsSync()) {
      stderr.writeln(
          '${Constants.errorMessage} Error: Directory already exists: $name');
      exit(1);
    }

    if (verbose) {
      stdout.writeln('📁 Creating project directory: $projectDir');
    }

    await CopyUtils.copyDirectory(templateDir, projectDir, verbose);
    await PubspecUtils.updatePubspec(
        projectDir, Constants.baseKitAppTemplate, name, verbose);
    await _createReadme(
        projectDir, name, ReadmeTemplates.appReadme(name), verbose);
    await _updateMetadata(projectDir, name, org, verbose);

    stdout
      ..writeln('${Constants.successMessage} Flutter app created successfully!')
      ..writeln('')
      ..writeln('Next steps:')
      ..writeln('  cd $name')
      ..writeln('  flutter pub get')
      ..writeln('  flutter run');
  }

  /// Create package template
  static Future<void> _createPackageTemplate(
    String name,
    String? org,
    bool verbose,
  ) async {
    final packageDir = CopyUtils.findTemplatePath();
    final templateDir =
        path.join(packageDir, 'templates', Constants.baseKitPackageTemplate);

    if (!Directory(templateDir).existsSync()) {
      stderr.writeln(
          '${Constants.errorMessage} Error: Template directory not found: $templateDir');
      exit(1);
    }

    final projectDir = path.join(Directory.current.path, name);
    if (Directory(projectDir).existsSync()) {
      stderr.writeln(
          '${Constants.errorMessage} Error: Directory already exists: $name');
      exit(1);
    }

    if (verbose) {
      stdout.writeln('📁 Creating package directory: $projectDir');
    }

    await CopyUtils.copyDirectory(templateDir, projectDir, verbose);
    await PubspecUtils.updatePubspec(
        projectDir, Constants.baseKitPackageTemplate, name, verbose);
    await _createReadme(
        projectDir, name, ReadmeTemplates.packageReadme(name), verbose);
    await _updateMetadata(projectDir, name, org, verbose);

    stdout
      ..writeln(
          '${Constants.successMessage} Flutter package created successfully!')
      ..writeln('')
      ..writeln('Next steps:')
      ..writeln('  cd $name')
      ..writeln('  flutter pub get')
      ..writeln('  flutter test');
  }

  /// Create package with tester template
  static Future<void> _createPackageWithTester(
    String name,
    String? org,
    bool verbose,
  ) async {
    final root = CopyUtils.findTemplatePath();
    final packageTemplate =
        path.join(root, 'templates', Constants.baseKitPackageTemplate);
    final testerTemplate =
        path.join(root, 'templates', Constants.baseKitTesterTemplate);

    if (!Directory(packageTemplate).existsSync() ||
        !Directory(testerTemplate).existsSync()) {
      stderr.writeln(
          '${Constants.errorMessage} Error: Template directories not found');
      exit(1);
    }

    final projectDir = path.join(Directory.current.path, name);
    if (Directory(projectDir).existsSync()) {
      stderr.writeln(
          '${Constants.errorMessage} Error: Directory already exists: $name');
      exit(1);
    }

    if (verbose) {
      stdout.writeln('📁 Creating project directory: $projectDir');
    }

    final packageName = '${name}_package';
    final testerName = '${name}_tester';
    final packageDir = path.join(projectDir, packageName);
    final testerDir = path.join(projectDir, testerName);

    // Create package
    await CopyUtils.copyDirectory(packageTemplate, packageDir, verbose);
    await PubspecUtils.updatePubspec(
        packageDir, Constants.baseKitPackageTemplate, packageName, verbose);
    await _createReadme(packageDir, packageName,
        ReadmeTemplates.packageReadme(packageName), verbose);
    await _updateMetadata(packageDir, packageName, org, verbose);

    // Create tester
    await CopyUtils.copyDirectory(testerTemplate, testerDir, verbose);
    await PubspecUtils.updateTesterPubspec(
        testerDir, testerName, packageName, verbose);
    await _createReadme(testerDir, testerName,
        ReadmeTemplates.testerReadme(testerName, packageName), verbose);
    await _updateMetadata(testerDir, testerName, org, verbose);

    // Create root README
    await _createReadme(projectDir, name,
        ReadmeTemplates.rootReadme(name, packageName, testerName), verbose);

    stdout
      ..writeln(
          '${Constants.successMessage} Flutter package with tester created successfully!')
      ..writeln('')
      ..writeln('Next steps:')
      ..writeln('  cd $name/$packageName')
      ..writeln('  flutter pub get')
      ..writeln('  flutter test')
      ..writeln('')
      ..writeln('  cd ../$testerName')
      ..writeln('  flutter pub get')
      ..writeln('  flutter run');
  }

  /// Create README file
  static Future<void> _createReadme(
    String projectDir,
    String name,
    String content,
    bool verbose,
  ) async {
    final readmeFile = File(path.join(projectDir, Constants.readmeFileName));
    await readmeFile.writeAsString(content);
    if (verbose) {
      stdout.writeln('${Constants.readmeMessage} Created README.md');
    }
  }

  /// Update metadata file
  static Future<void> _updateMetadata(
    String projectDir,
    String name,
    String? org,
    bool verbose,
  ) async {
    final metadataFile =
        File(path.join(projectDir, Constants.metadataFileName));
    if (metadataFile.existsSync()) {
      String content = await metadataFile.readAsString();
      content = content.replaceAll('base_kit_app', name);
      if (org != null) {
        content = content.replaceAll('com.base.kit', org);
      }
      await metadataFile.writeAsString(content);
      if (verbose) {
        stdout.writeln('${Constants.updateMessage} Updated .metadata');
      }
    }
  }
}
