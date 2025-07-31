#!/usr/bin/env dart

import 'package:flutter_base_kit/generator/cli/arg_parser.dart';
import 'package:flutter_base_kit/generator/cli/commands/create_command.dart';
import 'package:flutter_base_kit/generator/cli/commands/init_command.dart';
import 'package:flutter_base_kit/generator/cli/commands/module_command.dart';
import 'dart:io';

void main(List<String> arguments) async {
  final parser = CliArgParser.createParser();

  try {
    final results = parser.parse(arguments);

    if (results['help'] as bool) {
      CliArgParser.showHelp();
      return;
    }

    if (results.command == null) {
      CliArgParser.showHelp();
      return;
    }

    switch (results.command!.name) {
      case 'create':
        await CreateCommand.handle(results.command!);
        break;
      case 'init':
        await InitCommand.handle(results.command!);
        break;
      case 'module':
        await ModuleCommand.handle(results.command!);
        break;
      default:
        CliArgParser.showHelp();
    }
  } catch (e) {
    stderr.writeln('❌ Error: $e');
    exit(1);
  }
}
