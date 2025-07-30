# Flutter Base Kit

A comprehensive Flutter development toolkit that provides a solid foundation for building modern Flutter applications with best practices, dependency injection, routing, networking, and more.

## Features

- 🚀 **Project Templates**: Create apps, packages, or package+tester projects
- 🔧 **Dependency Injection**: GetIt + Injectable for clean architecture
- 🌐 **Networking**: Dio + Retrofit for API communication
- 🌍 **Localization**: Multi-language support with ARB files
- 🎨 **Theme System**: Flexible theming with BaseDesigns + CustomDesigns
- 📱 **State Management**: Provider + Bloc for state management
- 🔄 **Code Generation**: Freezed, JSON serialization, and more
- 🛣️ **Routing**: AutoRoute for declarative navigation
- 📦 **CLI Tool**: Command-line interface for project generation

## Installation

### Local Development (Recommended for now)

Since the package is not yet published to pub.dev, you can use it locally:

```bash
git clone https://github.com/Okladnoj/flutter_base_kit.git
cd flutter_base_kit
dart pub get

# Run the CLI tool locally
dart run bin/flutter_base_kit.dart create my_app --template app
```

### Global Installation (After publication)

Once published to pub.dev:

```bash
dart pub global activate flutter_base_kit
```

## Usage

### CLI Commands

#### Create a new Flutter app

```bash
# Basic app creation
flutter_base_kit create my_app

# With organization identifier
flutter_base_kit create my_app --org com.example

# With verbose output
flutter_base_kit create my_app --template app --org com.example --verbose
```

#### Create a Flutter package

```bash
# Create a package
flutter_base_kit create my_package --template package

# With organization identifier
flutter_base_kit create my_package --template package --org com.example
```

#### Create a package with tester

```bash
# Create package + tester project
flutter_base_kit create my_project --template package+tester

# With organization identifier
flutter_base_kit create my_project --template package+tester --org com.example
```

#### Initialize existing project

```bash
# Add flutter_base_kit to existing project
flutter_base_kit init
```

### Template Types

- **`app`**: Full Flutter application with all features
- **`package`**: Flutter package/plugin template
- **`package+tester`**: Package with separate tester application

### CLI Options

- `--org`: Organization identifier (e.g., com.example)
- `--template`: Template type (app, package, package+tester)
- `--verbose`: Enable verbose output
- `--help`: Show help message

## Project Structure

### App Template

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

### Package Template

```
lib/
├── src/           # Package source code
│   ├── ui/        # UI components
│   ├── themes/    # Theme system
│   ├── utils/     # Utilities
│   └── ...
└── example/       # Example usage
```

### Package + Tester Template

```
project_name/
├── project_name_package/     # Package
└── project_name_tester/      # Tester app
```

## Getting Started

1. **Create a new project**:
   ```bash
   flutter_base_kit create my_app --template app --org com.example
   ```

2. **Navigate to project**:
   ```bash
   cd my_app
   ```

3. **Install dependencies**:
   ```bash
   flutter pub get
   ```

4. **Run code generation**:
   ```bash
   flutter packages pub run build_runner build
   ```

5. **Run the app**:
   ```bash
   flutter run
   ```

## Dependencies

### Core Dependencies

- `flutter_bloc`: State management
- `get_it`: Dependency injection
- `injectable`: Code generation for DI
- `auto_route`: Declarative routing
- `dio`: HTTP client
- `retrofit`: Type-safe HTTP client
- `freezed`: Immutable data classes
- `json_annotation`: JSON serialization
- `flutter_localizations`: Localization support

### Development Dependencies

- `build_runner`: Code generation
- `injectable_generator`: DI code generation
- `auto_route_generator`: Route code generation
- `retrofit_generator`: Retrofit code generation
- `json_serializable`: JSON code generation
- `freezed`: Freezed code generation
- `flutter_gen_runner`: Asset code generation

## Configuration

### Localization

Add ARB files to `lib/l10n/`:
- `app_en.arb` - English translations
- `app_ru.arb` - Russian translations

### Assets

Configure assets in `pubspec.yaml`:
```yaml
flutter:
  assets:
    - assets/images/
    - assets/svg/
    - assets/lottie/
    - assets/icons/
  fonts:
    - family: Nunito
      fonts:
        - asset: fonts/nunito/Nunito-Regular.ttf
```

### Code Generation

Run code generation after changes:
```bash
flutter packages pub run build_runner build --delete-conflicting-outputs
```

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Submit a pull request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Support

If you encounter any issues or have questions, please:

1. Check the [documentation](https://github.com/Okladnoj/flutter_base_kit)
2. Search existing [issues](https://github.com/Okladnoj/flutter_base_kit/issues)
3. Create a new issue with detailed information

## Changelog

See [CHANGELOG.md](CHANGELOG.md) for a list of changes and version history.
