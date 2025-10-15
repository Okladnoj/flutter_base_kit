/// Flutter Base Kit - Complete Flutter Development Foundation
///
/// A comprehensive toolkit that provides everything you need to build
/// production-ready Flutter applications with best practices and
/// time-tested patterns.
///
/// ## Core Features
///
/// ### State Management
/// - [BaseProvider] - ChangeNotifier-based state management
/// - [BaseBloc] - BLoC pattern implementation
/// - [BaseCubit] - Cubit pattern implementation
/// - [BaseStateI] - Common state interface
///
/// ### Error Handling
/// - [BaseException] - Base exception class
/// - [ApiException] - API-specific exceptions
/// - [ApplicationException] - Application-specific exceptions
///
/// ### UI Components
/// - [AppKitLoader] - Global loading widget
/// - [AppDefaultLoader] - Default loading indicator
/// - [appListener] - State change listener
/// - [AppBuilder] - Reactive widget builder
/// - [AppConsumer] - BLoC consumer wrapper
///
/// ### Utilities
/// - [loggerApp] - Cross-platform logging
/// - [Validators] - Form validation utilities
/// - String and Color extensions
///
/// ### Initialization
/// - [KitInitializer] - App initialization
/// - [ColorsSet] - Global color management
/// - [StringsSet] - Global string management
///
/// ## Quick Start
///
/// ```dart
/// import 'package:flutter_base_kit/flutter_base_kit.dart';
///
/// void main() async {
///   WidgetsFlutterBinding.ensureInitialized();
///
///   await KitInitializer.initialize(
///     errorHandler: (error) => loggerApp.e(error),
///     loadPreset: AppDefaultLoader(),
///   );
///
///   runApp(MyApp());
/// }
/// ```
///
/// ## Documentation
///
/// For detailed documentation and examples, visit:
/// https://pub.dev/packages/flutter_base_kit
library;

export 'src/base/core/core.dart';
export 'src/base/exceptions/api_exception.dart';
export 'src/base/exceptions/application_exception.dart';
export 'src/base/exceptions/base_exception.dart';
export 'src/base/service/base_service.dart';
export 'src/initializer/kit_initializer.dart';
export 'src/ui/base_builders/app_builder.dart';
export 'src/ui/base_builders/app_consumer.dart';
export 'src/ui/base_builders/app_listener.dart';
export 'src/utils/logger/ansi_parser.dart';
export 'src/utils/logger/logger.dart';
export 'src/utils/validators.dart';
export 'src/utils/extensions/string_extensions.dart';
export 'src/utils/extensions/color_extensions.dart';
