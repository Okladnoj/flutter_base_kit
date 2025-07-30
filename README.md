# Flutter Base Kit 🚀

**Ready-to-use toolkit for quick Flutter project setup**

Create new Flutter applications with pre-configured architecture: routing, DI, networking, localization, theming, and much more.

## Why Flutter Base Kit?

- ⚡ **Quick Start** - don't waste time setting up architecture
- 🏗️ **Ready Structure** - DI, routing, API, themes, localization
- 📱 **Best Practices** - proven architecture from real projects
- 🔧 **CLI Tool** - create projects with a single command

## Installation

### Activate package globally

```bash
dart pub global activate flutter_base_kit
```
<details>
<summary>If command not found</summary>

**Windows:**
- Add to PATH: `%LOCALAPPDATA%\Pub\Cache\bin`

**macOS/Linux:**
- Add to ~/.bashrc or ~/.zshrc: `export PATH="$PATH":"$HOME/.pub-cache/bin"`

📋 If you don't have Dart/Flutter SDK installed

### Windows
1. Download Flutter SDK from [flutter.dev](https://flutter.dev/docs/get-started/install/windows)
2. Extract and add to PATH
3. Run `flutter doctor`

### macOS
```bash
brew install flutter
flutter doctor
```

### Linux
```bash
sudo snap install flutter --classic
flutter doctor
```

</details>

## How to use

### Option 1: Create a new project

```bash
# Create an app
flutter_base_kit create my_app --template app

# Create a package
flutter_base_kit create my_package --template package

# Create a package with tester
flutter_base_kit create my_project --template package+tester
```

### Option 2: Add to existing project

```bash
# Navigate to your project folder
cd my_existing_project

# Initialize Flutter Base Kit
flutter_base_kit init
```

## What you get in the project

### 📁 Application structure
```
lib/
├── api/           # API and network requests
├── core/          # Core logic
├── di/            # Dependency injection
├── l10n/          # Localization (EN, RU)
├── models/        # Data models
├── routes/        # Navigation
├── services/      # Services
├── themes/        # Theming
├── ui/            # UI components
└── utils/         # Utilities
```

### 🛠️ Ready components
- **Routing** - AutoRoute for navigation
- **DI** - GetIt + Injectable for dependency management
- **API** - Dio + Retrofit for server communication
- **State** - Provider + Bloc for state management
- **Themes** - Flexible theming with light/dark support
- **Localization** - Support for Russian and English languages
- **Code Generation** - Freezed, JSON, routes are generated automatically

## Command examples

```bash
# Create an app
flutter_base_kit create my_app --template app --org com.mycompany

# Create a package
flutter_base_kit create my_package --template package

# Create a monorepo (package + tester)
flutter_base_kit create my_library --template package+tester --org com.mycompany

# Add to existing project
flutter_base_kit init
```

## Next steps

After creating a project:

1. **Navigate to project folder**:
   ```bash
   cd my_app
   ```

2. **Install dependencies**:
   ```bash
   flutter pub get
   ```

3. **Generate code**:
   ```bash
   flutter packages pub run build_runner build
   ```

4. **Run the app**:
   ```bash
   flutter run
   ```

## Useful commands

```bash
# Show help
flutter_base_kit --help

# Generate code (in project)
flutter packages pub run build_runner build --delete-conflicting-outputs
```

## Template types

- **`app`** - Full Flutter application with all components
- **`package`** - Flutter package/plugin for code reuse
- **`package+tester`** - Package + separate testing application

## Command options

- `--org` - Organization identifier (e.g., com.mycompany)
- `--template` - Template type (app, package, package+tester)
- `--help` - Show help

## Troubleshooting

### Code generation errors

```bash
# Clear cache and regenerate
flutter packages pub run build_runner clean
flutter packages pub run build_runner build --delete-conflicting-outputs
```

## Support

- 📖 **Documentation**: [GitHub](https://github.com/Okladnoj/flutter_base_kit)
- 🐛 **Issues**: [Issues](https://github.com/Okladnoj/flutter_base_kit/issues)
- 📝 **Changelog**: [CHANGELOG.md](CHANGELOG.md)

## License

MIT License - see [LICENSE](LICENSE) file
