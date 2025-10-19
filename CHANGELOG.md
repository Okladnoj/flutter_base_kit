## 1.3.13

- Improve DI module with GetIt integration for better dependency management
- Add fallback logic to check GetIt registry before creating new instances


## 1.3.12

- Add ANSI color parser for colored log output in viewers
- Keep ANSI codes in log files and render them with colors in UI


## 1.3.11

- Add horizontal scrolling to logs viewers (app logs and crash logs)
- Disable line wrapping in logs - each line displays as single line with maxLines: 1
- Add vertical and horizontal scroll bars with controllers for better navigation
- Apply to both base_kit_app and base_kit_package templates


## 1.3.10

- Add LogOutputHandler callback for custom log output (file, database, server)
- Logger now sends exact same formatted output to handler as appears in console
- Add default logger configurations for base_kit_app and base_kit_package templates
- Update web logger templates to use package:web instead of deprecated dart:html


## 1.3.9

- Add formatter section to analysis options for consistent trailing commas


## 1.3.8

- Fixed String _toCamelCase


## 1.3.7

- Fix module command to generate camelCase module name


## 1.3.6

- Improve module command to generate camelCase module name
- Improve settings state to use system theme
- Improve theme selector and language selector to use system theme


## 1.3.5

- Upgrade build_runner to version 2.7.1
- Adjust localization_helper.dart to use appLocale instead of _userLocale for better clarity
- Added KitInitializer.initialize to templates


## 1.3.4

- Fixed templates by state statuses
- Remove linter rule for go_router


## 1.3.3

- Fixed version to retrofit_generator: ^10.0.2
- Remove unnecessary logic at template


## 1.3.2

- Update all dependencies to maximum compatible versions after Flutter SDK update
- Remove unnecessary dependencies and fix compatibility issues between main package and templates
- Add new request_tracker functionality and improve overall package structure


## 1.3.1

- Remove unnecessary dependencies from main package to keep it lightweight
- Ensure compatibility between main package and all templates
- Update build_runner to ^2.4.8 for better compatibility
- Fix dependency conflicts between templates and main package


## 1.3.0

- Update all dependencies to latest compatible versions after Flutter SDK update
- Fix intl dependency conflict by updating to ^0.20.2 in all templates
- Upgrade flutter_lints from ^5.0.0 to ^6.0.0 across all projects
- Update freezed to ^3.2.0 in main project and example
- Update freezed to ^3.1.0 in templates for source_gen compatibility
- Update json_serializable to ^6.10.0 in main project and example
- Add source_gen ^3.0.0 to main project and example
- Update retrofit to ^4.7.1 in base_kit_package template
- Update auto_route_generator to ^10.2.3 in base_kit_package template
- Add new request_tracker functionality to app and package templates
- Update homepage URL to resume-okji.web.app
- Add screenshots section to pubspec.yaml
- Move freezed and json_serializable from dev_dependencies to dependencies
- Regenerate localization files with updated dependencies
- Update DI configuration files with new dependencies


## 1.2.4

- Fix build.yaml not being copied from package template
- Add proper file copying for package+tester template
- Update create command to include build.yaml in package generation
- Ensure all template files are properly copied during project creation
- Improve template copying logic for better consistency


## 1.2.3

- Add module command for generating complete API → Service → Cubit → Page modules
- Add UI component library (AppKitLoader, AppDialog, AppSnackBar, AppBuilder)
- Add automatic snake_case to PascalCase conversion
- Add build runner integration after module creation
- Update README with complete documentation for new features


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
