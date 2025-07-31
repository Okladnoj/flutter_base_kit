import 'dart:io';
import 'package:args/args.dart';
import 'package:path/path.dart' as path;
import '../../constants.dart';
import '../../io/copy_utils.dart';
import '../../io/pubspec_utils.dart';
import '../../templates/readme_templates.dart';

/// Command for creating new Flutter projects
class CreateCommand {
  /// Run dart pub get in the specified directory
  static Future<void> _runPubGet(String directory, bool verbose) async {
    if (verbose) {
      stdout.writeln('📦 Running dart pub get in: $directory');
    }

    final result =
        await Process.run('dart', ['pub', 'get'], workingDirectory: directory);

    if (result.exitCode != 0) {
      stderr
          .writeln('⚠️ Warning: Failed to run dart pub get: ${result.stderr}');
    } else if (verbose) {
      stdout.writeln('✅ Dependencies installed successfully');
    }
  }

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
    final projectDir = path.join(Directory.current.path, name);
    if (Directory(projectDir).existsSync()) {
      stderr.writeln(
          '${Constants.errorMessage} Error: Directory already exists: $name');
      exit(1);
    }

    if (verbose) {
      stdout.writeln('📱 Creating app: $name');
    }

    final orgParam = org ?? 'com.base.kit';
    final result = await Process.run(
        'flutter', ['create', '--org', orgParam, '--template=app', name]);

    if (result.exitCode != 0) {
      stderr.writeln(
          '${Constants.errorMessage} Error creating app: ${result.stderr}');
      exit(1);
    }

    // Copy assets, fonts, and configs from template
    await _copyAppTemplateContent(projectDir, verbose);

    // Update pubspec file
    await PubspecUtils.updateAppPubspec(projectDir, name, verbose);

    // Remove default test directory
    await _removeDefaultTestDirectory(projectDir, verbose);

    // Create README
    await _createReadme(
        projectDir, name, ReadmeTemplates.appReadme(name), verbose);

    // Run flutter pub get
    await _runPubGet(projectDir, verbose);

    stdout
      ..writeln('${Constants.successMessage} Flutter app created successfully!')
      ..writeln('')
      ..writeln('Next steps:')
      ..writeln('  cd $name')
      ..writeln('  flutter run');
  }

  /// Create package template
  static Future<void> _createPackageTemplate(
    String name,
    String? org,
    bool verbose,
  ) async {
    final projectDir = path.join(Directory.current.path, name);
    if (Directory(projectDir).existsSync()) {
      stderr.writeln(
          '${Constants.errorMessage} Error: Directory already exists: $name');
      exit(1);
    }

    if (verbose) {
      stdout.writeln('📦 Creating package: $name');
    }

    final orgParam = org ?? 'com.base.kit';
    final result = await Process.run(
        'flutter', ['create', '--org', orgParam, '--template=package', name]);

    if (result.exitCode != 0) {
      stderr.writeln(
          '${Constants.errorMessage} Error creating package: ${result.stderr}');
      exit(1);
    }

    // Copy assets, fonts, and configs from template
    await _copyPackageTemplateContent(projectDir, verbose);

    // Update pubspec file
    await PubspecUtils.updatePackagePubspec(projectDir, name, verbose);

    // Create README
    await _createReadme(
        projectDir, name, ReadmeTemplates.packageReadme(name), verbose);

    // Run flutter pub get
    await _runPubGet(projectDir, verbose);

    stdout
      ..writeln(
          '${Constants.successMessage} Flutter package created successfully!')
      ..writeln('')
      ..writeln('Next steps:')
      ..writeln('  cd $name')
      ..writeln('  flutter test');
  }

  /// Create package with tester template
  static Future<void> _createPackageWithTester(
    String name,
    String? org,
    bool verbose,
  ) async {
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

    // Create project directory
    await Directory(projectDir).create(recursive: true);

    // Create package using flutter create
    if (verbose) {
      stdout.writeln('📦 Creating package: $packageName');
    }

    final orgParam = org ?? 'com.base.kit';
    final packageResult = await Process.run('flutter',
        ['create', '--org', orgParam, '--template=package', packageName],
        workingDirectory: projectDir);

    if (packageResult.exitCode != 0) {
      stderr.writeln(
          '${Constants.errorMessage} Error creating package: ${packageResult.stderr}');
      exit(1);
    }

    // Create tester using flutter create
    if (verbose) {
      stdout.writeln('🧪 Creating tester: $testerName');
    }

    final testerResult = await Process.run('flutter',
        ['create', '--org', orgParam, '--template=app', '--empty', testerName],
        workingDirectory: projectDir);

    if (testerResult.exitCode != 0) {
      stderr.writeln(
          '${Constants.errorMessage} Error creating tester: ${testerResult.stderr}');
      exit(1);
    }

    // Copy assets, fonts, and configs from templates
    await _copyTemplateContent(packageDir, testerDir, packageName, verbose);

    // Copy lib directory content for package
    await _copyPackageLibContent(packageDir, verbose);

    // Update pubspec files
    await PubspecUtils.updatePackagePubspec(packageDir, packageName, verbose);
    await PubspecUtils.updateTesterPubspec(
        testerDir, testerName, packageName, verbose);

    // Create README files
    await _createReadme(packageDir, packageName,
        ReadmeTemplates.packageReadme(packageName), verbose);
    await _createReadme(testerDir, testerName,
        ReadmeTemplates.testerReadme(testerName, packageName), verbose);
    await _createReadme(projectDir, name,
        ReadmeTemplates.rootReadme(name, packageName, testerName), verbose);

    // Run flutter pub get for both package and tester
    await _runPubGet(packageDir, verbose);
    await _runPubGet(testerDir, verbose);

    stdout
      ..writeln(
          '${Constants.successMessage} Flutter package with tester created successfully!')
      ..writeln('')
      ..writeln('Next steps:')
      ..writeln('  cd $name/$packageName')
      ..writeln('  flutter test')
      ..writeln('')
      ..writeln('  cd ../$testerName')
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

  /// Copy template content (assets, fonts, configs) to created projects
  static Future<void> _copyTemplateContent(
    String packageDir,
    String testerDir,
    String packageName,
    bool verbose,
  ) async {
    final root = CopyUtils.findTemplatePath();
    final packageTemplate =
        path.join(root, 'templates', Constants.baseKitPackageTemplate);
    final testerTemplate =
        path.join(root, 'templates', Constants.baseKitTesterTemplate);

    if (verbose) {
      stdout.writeln('📁 Copying template content...');
    }

    // Copy assets, fonts, and configs to package
    await _copyDirectoryIfExists(
        packageTemplate, packageDir, 'assets', verbose);
    await _copyDirectoryIfExists(packageTemplate, packageDir, 'fonts', verbose);
    await _copyFileIfExists(
        packageTemplate, packageDir, 'flutter_native_splash.yaml', verbose);
    await _copyFileIfExists(packageTemplate, packageDir, 'l10n.yaml', verbose);

    // Copy assets, fonts, and configs to tester
    await _copyDirectoryIfExists(testerTemplate, testerDir, 'assets', verbose);
    await _copyDirectoryIfExists(testerTemplate, testerDir, 'fonts', verbose);
    await _copyFileIfExists(
        testerTemplate, testerDir, 'flutter_native_splash.yaml', verbose);
    await _copyFileIfExists(
        testerTemplate, testerDir, 'analysis_options.yaml', verbose);

    // Copy main.dart for tester
    await _copyTesterMainFile(testerDir, packageName, verbose);
  }

  /// Copy package template content (assets, fonts, configs) to created package
  static Future<void> _copyPackageTemplateContent(
    String packageDir,
    bool verbose,
  ) async {
    final root = CopyUtils.findTemplatePath();
    final packageTemplate =
        path.join(root, 'templates', Constants.baseKitPackageTemplate);

    if (verbose) {
      stdout.writeln('📁 Copying package template content...');
    }

    // Copy assets, fonts, and configs to package
    await _copyDirectoryIfExists(
        packageTemplate, packageDir, 'assets', verbose);
    await _copyDirectoryIfExists(packageTemplate, packageDir, 'fonts', verbose);
    await _copyFileIfExists(
        packageTemplate, packageDir, 'flutter_native_splash.yaml', verbose);
    await _copyFileIfExists(packageTemplate, packageDir, 'l10n.yaml', verbose);
    await _copyFileIfExists(
        packageTemplate, packageDir, 'analysis_options.yaml', verbose);

    // Copy lib directory content
    await _copyPackageLibContent(packageDir, verbose);
  }

  /// Copy app template content (assets, fonts, configs, lib) to created app
  static Future<void> _copyAppTemplateContent(
    String appDir,
    bool verbose,
  ) async {
    final root = CopyUtils.findTemplatePath();
    final appTemplate =
        path.join(root, 'templates', Constants.baseKitAppTemplate);

    if (verbose) {
      stdout.writeln('📱 Copying app template content...');
    }

    // Copy assets, fonts, and configs to app
    await _copyDirectoryIfExists(appTemplate, appDir, 'assets', verbose);
    await _copyDirectoryIfExists(appTemplate, appDir, 'fonts', verbose);
    await _copyFileIfExists(
        appTemplate, appDir, 'flutter_native_splash.yaml', verbose);
    await _copyFileIfExists(appTemplate, appDir, 'l10n.yaml', verbose);
    await _copyFileIfExists(
        appTemplate, appDir, 'analysis_options.yaml', verbose);

    // Copy lib directory content (skip main.dart as it's created by flutter create)
    await _copyAppLibContent(appDir, verbose);

    // Copy main.dart from template (overwrite the default one)
    await _copyAppMainFile(appDir, verbose);
  }

  /// Copy app lib directory content
  static Future<void> _copyAppLibContent(
    String appDir,
    bool verbose,
  ) async {
    final root = CopyUtils.findTemplatePath();
    final appTemplate =
        path.join(root, 'templates', Constants.baseKitAppTemplate);

    // Copy lib directory content (but not the main dart file)
    final libTemplateDir = path.join(appTemplate, 'lib');
    final libDestDir = path.join(appDir, 'lib');

    if (Directory(libTemplateDir).existsSync()) {
      await for (final entity in Directory(libTemplateDir)
          .list(recursive: true, followLinks: false)) {
        final rel = path.relative(entity.path, from: libTemplateDir);

        // Skip the main dart file (it's already created by flutter create)
        if (rel == 'main.dart') continue;

        final destPath = path.join(libDestDir, rel);

        if (entity is File) {
          final destFile = File(destPath);
          await destFile.parent.create(recursive: true);
          await destFile.writeAsBytes(await entity.readAsBytes());
          if (verbose) {
            stdout.writeln('  📄 lib/$rel');
          }
        } else if (entity is Directory) {
          await Directory(destPath).create(recursive: true);
        }
      }
    }
  }

  /// Copy app main.dart file from template
  static Future<void> _copyAppMainFile(
    String appDir,
    bool verbose,
  ) async {
    final root = CopyUtils.findTemplatePath();
    final appTemplate =
        path.join(root, 'templates', Constants.baseKitAppTemplate);
    final sourcePath = path.join(appTemplate, 'lib', 'main.dart');
    final destPath = path.join(appDir, 'lib', 'main.dart');

    if (File(sourcePath).existsSync()) {
      await File(sourcePath).copy(destPath);
      if (verbose) {
        stdout.writeln('  📄 Updated main.dart');
      }
    }
  }

  /// Remove default test directory created by flutter create
  static Future<void> _removeDefaultTestDirectory(
    String projectDir,
    bool verbose,
  ) async {
    final testDir = Directory(path.join(projectDir, 'test'));
    if (testDir.existsSync()) {
      await testDir.delete(recursive: true);
      if (verbose) {
        stdout.writeln(
            '${Constants.updateMessage} Removed default test directory');
      }
    }
  }

  /// Copy package lib directory content
  static Future<void> _copyPackageLibContent(
    String packageDir,
    bool verbose,
  ) async {
    final root = CopyUtils.findTemplatePath();
    final packageTemplate =
        path.join(root, 'templates', Constants.baseKitPackageTemplate);

    // Copy lib directory content (but not the main dart file)
    final libTemplateDir = path.join(packageTemplate, 'lib');
    final libDestDir = path.join(packageDir, 'lib');

    if (Directory(libTemplateDir).existsSync()) {
      await for (final entity in Directory(libTemplateDir)
          .list(recursive: true, followLinks: false)) {
        final rel = path.relative(entity.path, from: libTemplateDir);

        // Skip the main dart file (it's already created by flutter create)
        if (rel == 'base_kit_package.dart') continue;

        final destPath = path.join(libDestDir, rel);

        if (entity is File) {
          final destFile = File(destPath);
          await destFile.parent.create(recursive: true);
          await destFile.writeAsBytes(await entity.readAsBytes());
          if (verbose) {
            stdout.writeln('  📄 lib/$rel');
          }
        } else if (entity is Directory) {
          await Directory(destPath).create(recursive: true);
        }
      }
    }
  }

  /// Copy directory if it exists in source
  static Future<void> _copyDirectoryIfExists(
    String sourceDir,
    String destDir,
    String dirName,
    bool verbose,
  ) async {
    final sourcePath = path.join(sourceDir, dirName);
    final destPath = path.join(destDir, dirName);

    if (Directory(sourcePath).existsSync()) {
      await CopyUtils.copyDirectory(sourcePath, destPath, verbose);
      if (verbose) {
        stdout.writeln('  📁 Copied $dirName/');
      }
    }
  }

  /// Copy file if it exists in source
  static Future<void> _copyFileIfExists(
    String sourceDir,
    String destDir,
    String fileName,
    bool verbose,
  ) async {
    final sourcePath = path.join(sourceDir, fileName);
    final destPath = path.join(destDir, fileName);

    if (File(sourcePath).existsSync()) {
      await File(sourcePath).copy(destPath);
      if (verbose) {
        stdout.writeln('  📄 Copied $fileName');
      }
    }
  }

  /// Copy tester main.dart file with proper imports
  static Future<void> _copyTesterMainFile(
    String testerDir,
    String packageName,
    bool verbose,
  ) async {
    final root = CopyUtils.findTemplatePath();
    final testerTemplate =
        path.join(root, 'templates', Constants.baseKitTesterTemplate);
    final sourcePath = path.join(testerTemplate, 'lib', 'main.dart');
    final destPath = path.join(testerDir, 'lib', 'main.dart');

    if (File(sourcePath).existsSync()) {
      String content = await File(sourcePath).readAsString();
      // Update package import
      content = content.replaceAll('base_kit_package', packageName);
      await File(destPath).writeAsString(content);
      if (verbose) {
        stdout.writeln('  📄 Updated main.dart');
      }
    }
  }
}
