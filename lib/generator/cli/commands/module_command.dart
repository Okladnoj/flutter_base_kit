import 'dart:io';
import 'package:args/args.dart';
import 'package:path/path.dart' as path;
import '../../constants.dart';
import '../../io/copy_utils.dart';

class ModuleCommand {
  static Future<void> handle(ArgResults cmd) async {
    final verbose = cmd['verbose'] as bool;
    final name = cmd['name'] as String?;

    if (name == null || name.isEmpty) {
      stderr.writeln(
          '${Constants.errorMessage} Error: Module name required (--name)');
      exit(1);
    }

    if (!_isValidModuleName(name)) {
      stderr.writeln(
          '${Constants.errorMessage} Error: Module name must be valid (e.g., user, user_store, product_item)');
      exit(1);
    }

    await _createModule(name, verbose);
  }

  static Future<void> _createModule(String name, bool verbose) async {
    stdout.writeln('${Constants.moduleMessage} Creating module: $name');

    final currentDir = Directory.current.path;
    final libDir = path.join(currentDir, 'lib');

    if (!Directory(libDir).existsSync()) {
      stderr.writeln(
          '${Constants.errorMessage} Error: Not a Flutter project (lib directory not found)');
      exit(1);
    }

    final isPackage = _isPackageProject(libDir);
    final baseTemplateDir = CopyUtils.findTemplatePath();
    final templateDir =
        path.join(baseTemplateDir, 'templates', 'base_kit_app', 'lib');

    await _copyModuleFiles(name, libDir, templateDir, isPackage, verbose);

    await _runBuildRunner(verbose);

    final prefix = isPackage ? 'lib/src' : 'lib';
    stdout.writeln(
        '${Constants.successMessage} Module $name created successfully!');
    stdout.writeln('${Constants.infoMessage} Files created:');
    stdout.writeln('  - $prefix/api/retrofit/$name/${name}_api.dart');
    stdout.writeln('  - $prefix/services/api/$name/${name}_service.dart');
    stdout.writeln('  - $prefix/models/$name/${name}_model.dart');
    stdout.writeln('  - $prefix/core/$name/${name}_cubit.dart');
    stdout.writeln('  - $prefix/ui/pages/app/pages/$name/${name}_page.dart');
  }

  static bool _isPackageProject(String libDir) {
    final srcDir = path.join(libDir, 'src');
    return Directory(srcDir).existsSync();
  }

  static Future<void> _copyModuleFiles(String name, String libDir,
      String templateDir, bool isPackage, bool verbose) async {
    final baseDir = isPackage ? path.join(libDir, 'src') : libDir;

    await _copyApiFiles(name, baseDir, templateDir, verbose);

    await _copyServiceFiles(name, baseDir, templateDir, verbose);

    await _copyModelFiles(name, baseDir, templateDir, verbose);

    await _copyCubitFiles(name, baseDir, templateDir, verbose);

    await _copyPageFiles(name, baseDir, templateDir, verbose);
  }

  static Future<void> _copyApiFiles(
      String name, String baseDir, String templateDir, bool verbose) async {
    final sourceDir = path.join(templateDir, 'api', 'retrofit', 'example');
    final targetDir = path.join(baseDir, 'api', 'retrofit', name);

    await _ensureDirectoryExists(targetDir, verbose);

    final sourceFile = File(path.join(sourceDir, 'example_api.dart'));
    final targetFile = File(path.join(targetDir, '${name}_api.dart'));

    if (sourceFile.existsSync()) {
      final content = sourceFile.readAsStringSync();
      final replacedContent = _replaceNames(content, 'example', name);
      await targetFile.writeAsString(replacedContent);

      if (verbose) {
        stdout.writeln('${Constants.fileMessage} Created: ${targetFile.path}');
      }
    }
  }

  static Future<void> _copyServiceFiles(
      String name, String baseDir, String templateDir, bool verbose) async {
    final sourceDir = path.join(templateDir, 'services', 'api', 'example');
    final targetDir = path.join(baseDir, 'services', 'api', name);

    await _ensureDirectoryExists(targetDir, verbose);

    final sourceFile = File(path.join(sourceDir, 'example_service.dart'));
    final targetFile = File(path.join(targetDir, '${name}_service.dart'));

    if (sourceFile.existsSync()) {
      final content = sourceFile.readAsStringSync();
      final replacedContent = _replaceNames(content, 'example', name);
      await targetFile.writeAsString(replacedContent);

      if (verbose) {
        stdout.writeln('${Constants.fileMessage} Created: ${targetFile.path}');
      }
    }
  }

  static Future<void> _copyModelFiles(
      String name, String baseDir, String templateDir, bool verbose) async {
    final sourceDir = path.join(templateDir, 'models', 'example');
    final targetDir = path.join(baseDir, 'models', name);

    await _ensureDirectoryExists(targetDir, verbose);

    final sourceFile = File(path.join(sourceDir, 'example_model.dart'));
    final targetFile = File(path.join(targetDir, '${name}_model.dart'));

    if (sourceFile.existsSync()) {
      final content = sourceFile.readAsStringSync();
      final replacedContent = _replaceNames(content, 'example', name);
      await targetFile.writeAsString(replacedContent);

      if (verbose) {
        stdout.writeln('${Constants.fileMessage} Created: ${targetFile.path}');
      }
    }
  }

  static Future<void> _copyCubitFiles(
      String name, String baseDir, String templateDir, bool verbose) async {
    final sourceDir = path.join(templateDir, 'core', 'example');
    final targetDir = path.join(baseDir, 'core', name);

    await _ensureDirectoryExists(targetDir, verbose);

    final sourceCubitFile = File(path.join(sourceDir, 'example_cubit.dart'));
    final targetCubitFile = File(path.join(targetDir, '${name}_cubit.dart'));

    if (sourceCubitFile.existsSync()) {
      final content = sourceCubitFile.readAsStringSync();
      final replacedContent = _replaceNames(content, 'example', name);
      await targetCubitFile.writeAsString(replacedContent);

      if (verbose) {
        stdout.writeln(
            '${Constants.fileMessage} Created: ${targetCubitFile.path}');
      }
    }

    final sourceStateFile = File(path.join(sourceDir, 'example_state.dart'));
    final targetStateFile = File(path.join(targetDir, '${name}_state.dart'));

    if (sourceStateFile.existsSync()) {
      final content = sourceStateFile.readAsStringSync();
      final replacedContent = _replaceNames(content, 'example', name);
      await targetStateFile.writeAsString(replacedContent);

      if (verbose) {
        stdout.writeln(
            '${Constants.fileMessage} Created: ${targetStateFile.path}');
      }
    }
  }

  static Future<void> _copyPageFiles(
      String name, String baseDir, String templateDir, bool verbose) async {
    final sourceDir =
        path.join(templateDir, 'ui', 'pages', 'app', 'pages', 'example');
    final targetDir = path.join(baseDir, 'ui', 'pages', 'app', 'pages', name);

    await _ensureDirectoryExists(targetDir, verbose);

    final sourceFile = File(path.join(sourceDir, 'example_page.dart'));
    final targetFile = File(path.join(targetDir, '${name}_page.dart'));

    if (sourceFile.existsSync()) {
      final content = sourceFile.readAsStringSync();
      final replacedContent = _replaceNames(content, 'example', name);
      await targetFile.writeAsString(replacedContent);

      if (verbose) {
        stdout.writeln('${Constants.fileMessage} Created: ${targetFile.path}');
      }
    }
  }

  static String _replaceNames(String content, String oldName, String newName) {
    final newPascalCase = _toPascalCase(newName);

    return content
        .replaceAll('example', newName)
        .replaceAll('Example', newPascalCase)
        .replaceAll('EXAMPLE', newName.toUpperCase());
  }

  static Future<void> _ensureDirectoryExists(
      String dirPath, bool verbose) async {
    final dir = Directory(dirPath);
    if (!dir.existsSync()) {
      await dir.create(recursive: true);
      if (verbose) {
        stdout.writeln('${Constants.fileMessage} Created directory: $dirPath');
      }
    }
  }

  static String _toPascalCase(String input) {
    if (input.isEmpty) return input;

    // Handle snake_case and simple names
    final words = input.split('_').where((word) => word.isNotEmpty);

    return words.map((word) {
      if (word.isEmpty) return word;
      return word[0].toUpperCase() + word.substring(1).toLowerCase();
    }).join('');
  }

  static bool _isValidModuleName(String input) {
    if (input.isEmpty) return false;

    // Allow snake_case and simple lowercase names
    final validNameRegex = RegExp(r'^[a-z][a-z0-9_]*$');

    if (input.contains('__')) return false;

    if (input.endsWith('_')) return false;

    return validNameRegex.hasMatch(input);
  }

  static Future<void> _runBuildRunner(bool verbose) async {
    if (verbose) {
      stdout.writeln('${Constants.infoMessage} Running build_runner...');
    }

    final result = await Process.run(
      'dart',
      ['pub', 'run', 'build_runner', 'build', '--delete-conflicting-outputs'],
      workingDirectory: Directory.current.path,
    );

    if (result.exitCode != 0) {
      stderr.writeln('⚠️ Warning: build_runner failed: ${result.stderr}');
    } else if (verbose) {
      stdout.writeln('✅ build_runner completed successfully');
    }
  }
}
