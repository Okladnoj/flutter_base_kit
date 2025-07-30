#!/usr/bin/env dart

import 'dart:io';
import 'package:args/args.dart';
import 'package:path/path.dart' as path;

void main(List<String> arguments) async {
  final parser = ArgParser()
    ..addCommand('create')
    ..addCommand('init')
    ..addFlag('help', abbr: 'h', negatable: false)
    ..addFlag('verbose', abbr: 'v', negatable: false)
    ..addOption('org', help: 'Organization identifier (e.g., com.example)')
    ..addOption('template',
        help: 'Template type: app, package, or package+tester',
        allowed: ['app', 'package', 'package+tester']);

  try {
    final results = parser.parse(arguments);

    if (results['help']) {
      _showHelp();
      return;
    }

    if (results.command?.name == 'create') {
      final name = results.command!.rest.firstOrNull;
      if (name == null) {
        print('❌ Error: Project name required');
        print(
            'Usage: flutter_base_kit create <project_name> [--org com.example] [--template app|package|package+tester]');
        exit(1);
      }

      final org = results['org'] as String?;
      final template = results['template'] as String? ?? 'app';

      await _createProject(name, org, template, results['verbose']);
    } else if (results.command?.name == 'init') {
      await _initProject(results['verbose']);
    } else {
      _showHelp();
    }
  } catch (e) {
    print('❌ Error: $e');
    exit(1);
  }
}

void _showHelp() {
  print('🚀 Flutter Base Kit - App template generator');
  print('');
  print('Usage: flutter_base_kit <command> [options]');
  print('');
  print('Commands:');
  print('  create <name>  Create new Flutter app from template');
  print('  init           Initialize current project with base kit');
  print('');
  print('Options:');
  print('  -h, --help     Show this help message');
  print('  -v, --verbose  Enable verbose output');
  print('');
  print('Examples:');
  print('  flutter_base_kit create my_app');
  print('  fbkit create my_app --verbose');
  print('  flutter_base_kit init');
}

Future<void> _createProject(
    String name, String? org, String template, bool verbose) async {
  print('🚀 Creating Flutter project: $name');
  print('📦 Template: $template');
  if (org != null) print('🏢 Organization: $org');

  try {
    switch (template) {
      case 'app':
        await _createAppTemplate(name, org, verbose);
        break;
      case 'package':
        await _createPackageTemplate(name, org, verbose);
        break;
      case 'package+tester':
        await _createPackageWithTester(name, org, verbose);
        break;
      default:
        print('❌ Error: Unknown template type: $template');
        exit(1);
    }
  } catch (e) {
    print('❌ Error creating project: $e');
    exit(1);
  }
}

Future<void> _initProject(bool verbose) async {
  print('🔧 Initializing current project with Flutter Base Kit');

  try {
    // Проверяем, что мы в Flutter проекте
    if (!File('pubspec.yaml').existsSync()) {
      print('❌ Error: Not a Flutter project (pubspec.yaml not found)');
      exit(1);
    }

    // Добавляем зависимость flutter_base_kit
    await _addDependency(verbose);

    print('✅ Project initialized with Flutter Base Kit!');
    print('');
    print('Next steps:');
    print('  flutter pub get');
    print('  Import flutter_base_kit in your main.dart');
  } catch (e) {
    print('❌ Error initializing project: $e');
    exit(1);
  }
}

Future<void> _copyDirectory(
    String source, String destination, bool verbose) async {
  final sourceDir = Directory(source);
  final destDir = Directory(destination);

  if (verbose) {
    print('📋 Copying files from $source to $destination');
  }

  await for (final entity in sourceDir.list(recursive: true)) {
    final relativePath = path.relative(entity.path, from: source);
    final destPath = path.join(destination, relativePath);

    if (entity is File) {
      // Пропускаем некоторые файлы
      if (relativePath.contains('.dart_tool') ||
          relativePath.contains('build') ||
          relativePath.contains('.git')) {
        continue;
      }

      final destFile = File(destPath);
      await destFile.parent.create(recursive: true);
      await destFile.writeAsBytes(await File(entity.path).readAsBytes());

      if (verbose) {
        print('  📄 $relativePath');
      }
    }
  }
}

Future<void> _updatePubspec(
    String projectDir, String name, bool verbose) async {
  final pubspecFile = File(path.join(projectDir, 'pubspec.yaml'));
  final content = await pubspecFile.readAsString();

  // Заменяем имя проекта
  final updatedContent = content
      .replaceAll('name: app_template', 'name: $name')
      .replaceAll('description: "Flutter app template with base structure"',
          'description: "A new Flutter project created with Flutter Base Kit"')
      .replaceAll(
          'flutter_base_kit:\n    path: ../../', 'flutter_base_kit: ^0.0.1');

  await pubspecFile.writeAsString(updatedContent);

  if (verbose) {
    print('📝 Updated pubspec.yaml');
  }
}

Future<void> _createReadme(String projectDir, String name, bool verbose) async {
  final readmeContent = '''# $name

A Flutter project created with [Flutter Base Kit](https://pub.dev/packages/flutter_base_kit).

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Features

- 🚀 **Routing**: AutoRoute for declarative navigation
- 🔧 **Dependency Injection**: GetIt + Injectable
- 🌐 **Networking**: Dio + Retrofit
- 🌍 **Localization**: Multi-language support
- 🎨 **Theme System**: BaseDesigns + CustomDesigns
- 📱 **State Management**: Provider + Bloc
- 🔄 **Code Generation**: Freezed, JSON serialization

## Getting Started

1. Install dependencies:
   ```bash
   flutter pub get
   ```

2. Run code generation:
   ```bash
   flutter packages pub run build_runner build
   ```

3. Run the app:
   ```bash
   flutter run
   ```

## Project Structure

```
lib/
├── api/           # API services and models
├── core/          # Core functionality
├── di/            # Dependency injection
├── l10n/          # Localization
├── models/        # Data models
├── routes/        # App routing
├── services/      # Business logic services
├── themes/        # App theming
├── ui/            # UI components
└── utils/         # Utilities
```

## Learn More

- [Flutter Base Kit Documentation](https://github.com/Okladnoj/flutter_base_kit)
- [Flutter Documentation](https://docs.flutter.dev/)
''';

  final readmeFile = File(path.join(projectDir, 'README.md'));
  await readmeFile.writeAsString(readmeContent);

  if (verbose) {
    print('📖 Created README.md');
  }
}

Future<void> _addDependency(bool verbose) async {
  final pubspecFile = File('pubspec.yaml');
  final content = await pubspecFile.readAsString();

  if (!content.contains('flutter_base_kit:')) {
    final updatedContent =
        content.replaceFirst('dependencies:', '''dependencies:
  flutter_base_kit: ^0.0.1''');

    await pubspecFile.writeAsString(updatedContent);

    if (verbose) {
      print('📦 Added flutter_base_kit dependency');
    }
  } else {
    if (verbose) {
      print('📦 flutter_base_kit dependency already exists');
    }
  }
}
