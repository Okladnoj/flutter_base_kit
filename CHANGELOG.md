## 1.2.2

- Make BaseService WASM-compatible with HTTP-based internet check
- Remove universal_io dependency to avoid WASM conflicts
- Ensure full WASM compatibility across all core components


## 1.2.1

- Add comprehensive documentation for all core components
- Add automatic dart pub get after project generation
- Fix library directive in main export file
- Update example with API → Service → Cubit → Consumer pattern


## 1.2.0

- Fix Navigator null check error in app_listener.dart
- Add WASM compatibility for logger with conditional compilation


## 1.1.8

- Refactor asset and font generation
- Refactor build.yaml to exclude plugin symlinks


## 1.1.7

- Update dependencies in pubspec.yaml(s)
- Note: build_runner has cyclic dependency issues in package template
- Update json_annotation to ^4.9.0


## 1.1.6

- Refactor app template generation to use flutter create + content copying approach
- Add proper Android configuration handling for single app generation
- Implement unified approach for package+tester and single app generation
- Add test directory removal for single app generation
- Fix pubspec.yaml name replacement for app templates
- Update main.dart copying for app templates
- Improve error handling and verbose logging throughout generation process


## 1.1.5

- Enhance version detection in copy_utils.dart to return the latest flutter_base_kit version
- Add debug output to version detection in copy_utils.dart
- Improve pubspec_utils.dart to update or add flutter_base_kit dependency with resolved version
- Ensure proper version handling and verbose logging in pubspec_utils.dart
- Improve regex logic in pub_publish.sh for accurate version updates


## 1.1.4

- Fix CHANGELOG.md formatting issues
- Improve pub_publish.sh script to handle changelog updates properly
- Better error handling for version detection

## 1.1.3

- Fix init command to use correct version from pub.dev instead of local path
- Automate version detection to prevent hardcoded version numbers
- Improved error handling for version detection

## 1.1.2

- Fix template path resolution for globally installed package
- Improved search algorithm to find any version of the package
- Better compatibility with pub.dev installation

## 1.1.1

- Fix template path resolution for globally installed package
- Improved search algorithm to find any version of the package
- Better compatibility with pub.dev installation

## 1.1.0

- Final stable release
- Complete English documentation
- Fixed typos and improved README
- Clean codebase with no Russian comments
- Optimized CLI tool with proper error handling
- Ready for production use

## 1.0.2

- Fix verbose flag support for init command
- Improve CLI argument parsing

## 1.0.1

- Fix template path resolution for globally installed package
- Improve CLI tool compatibility with pub.dev installation

## 1.0.0

- Initial release
- Flutter app template generator with modular CLI
- Support for app, package, and package+tester templates
- Built-in routing, DI, networking, localization, and theme system
- Global CLI tool with `flutter_base_kit` and `fbkit` commands
- Template customization with organization and template type options

## 0.0.1

- Initial Package
- Flutter app template with routing, DI, networking, localization, and theme system
- Provides base structure for new Flutter applications
