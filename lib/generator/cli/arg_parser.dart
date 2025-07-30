import 'dart:io';
import 'package:args/args.dart';
import '../constants.dart';

/// Argument parser for Flutter Base Kit CLI
class CliArgParser {
  static ArgParser createParser() {
    final parser = ArgParser();
    final createCmd = ArgParser()
      ..addOption(
        'template',
        abbr: 't',
        defaultsTo: Constants.appTemplate,
        allowed: [
          Constants.appTemplate,
          Constants.packageTemplate,
          Constants.packageWithTesterTemplate,
        ],
        help: 'Template type: app, package, or package+tester',
      )
      ..addOption(
        'org',
        abbr: 'o',
        help: 'Organization identifier (e.g., com.example)',
      )
      ..addFlag(
        'verbose',
        abbr: 'v',
        defaultsTo: false,
        help: 'Enable verbose output',
      );

    final initCmd = ArgParser()
      ..addFlag(
        'verbose',
        abbr: 'v',
        defaultsTo: false,
        help: 'Enable verbose output',
      );

    parser.addCommand('create', createCmd);
    parser.addCommand('init', initCmd);
    parser.addFlag('help',
        abbr: 'h', defaultsTo: false, help: 'Show this help message');
    parser.addFlag('verbose',
        abbr: 'v', defaultsTo: false, help: 'Enable verbose output');

    return parser;
  }

  static void showHelp() {
    stdout.writeln(
        '${Constants.createMessage} Flutter Base Kit - App template generator');
    stdout.writeln('');
    stdout.writeln('Usage: flutter_base_kit <command> [options]');
    stdout.writeln('');
    stdout.writeln('Commands:');
    stdout.writeln('  create <name>  Create new Flutter app from template');
    stdout.writeln('  init           Initialize current project with base kit');
    stdout.writeln('');
    stdout.writeln('Options:');
    stdout.writeln('  -h, --help     Show this help message');
    stdout.writeln('  -v, --verbose  Enable verbose output');
    stdout.writeln(
        '  --org          Organization identifier (e.g., com.example)');
    stdout.writeln(
        '  --template     Template type: app, package, or package+tester');
    stdout.writeln('');
    stdout.writeln('Examples:');
    stdout.writeln('  flutter_base_kit create my_app');
    stdout.writeln(
        '  flutter_base_kit create my_app --template app --org com.example');
    stdout.writeln('  flutter_base_kit create my_package --template package');
    stdout.writeln(
        '  flutter_base_kit create my_project --template package+tester');
  }
}
