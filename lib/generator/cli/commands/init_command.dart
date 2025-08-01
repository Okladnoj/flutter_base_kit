import 'dart:io';
import 'package:args/args.dart';
import '../../constants.dart';
import '../../io/copy_utils.dart';

class InitCommand {
  static Future<void> handle(ArgResults cmd) async {
    final verbose = cmd['verbose'] as bool;
    await _initProject(verbose);
  }

  static Future<void> _initProject(bool verbose) async {
    stdout.writeln(
        '${Constants.initMessage} Initializing current project with Flutter Base Kit');

    final pubspec = File(Constants.pubspecFileName);
    if (!pubspec.existsSync()) {
      stderr.writeln(
          '${Constants.errorMessage} Error: Not a Flutter project (pubspec.yaml not found)');
      exit(1);
    }

    await _addDependency(verbose);

    stdout
      ..writeln(
          '${Constants.successMessage} Project initialized with Flutter Base Kit!')
      ..writeln('')
      ..writeln('Next steps:')
      ..writeln('  flutter pub get')
      ..writeln('  Import flutter_base_kit in your main.dart');
  }

  static Future<void> _addDependency(bool verbose) async {
    final pubspecFile = File(Constants.pubspecFileName);
    String content = await pubspecFile.readAsString();

    if (content.contains('${Constants.flutterBaseKitPackage}:')) {
      if (verbose) {
        stdout.writeln(
            '${Constants.infoMessage} flutter_base_kit dependency already exists');
      }
      return;
    }

    final currentVersion = CopyUtils.getCurrentPackageVersion();
    if (currentVersion == null) {
      stderr.writeln(
          '${Constants.errorMessage} Error: Could not determine package version');
      exit(1);
    }

    final lines = content.split('\n');
    final dependenciesIndex =
        lines.indexWhere((line) => line.trim() == 'dependencies:');

    if (dependenciesIndex != -1) {
      lines.insert(dependenciesIndex + 1,
          '  ${Constants.flutterBaseKitPackage}: ^$currentVersion');

      await pubspecFile.writeAsString(lines.join('\n'));
      if (verbose) {
        stdout.writeln(
            '${Constants.infoMessage} Added flutter_base_kit dependency from pub.dev (version ^$currentVersion)');
      }
    }
  }
}
