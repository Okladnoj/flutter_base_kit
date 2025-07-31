import 'strings_set_model.dart';

/// Global string management system for Flutter Base Kit
///
/// Provides centralized access to application strings and localized text.
/// Strings can be customized globally by setting a custom [StringsSetModel].
///
/// Features:
/// - Common UI strings (OK, error messages, etc.)
/// - Localization support
/// - Dynamic string switching
/// - Consistent text across the application
///
/// Usage:
/// ```dart
/// // Access common strings
/// TextButton(
///   onPressed: () {},
///   child: Text(StringsSet.ok),
/// )
///
/// // Show error message
/// showDialog(
///   context: context,
///   builder: (context) => AlertDialog(
///     content: Text(StringsSet.somethingWentWrong),
///   ),
/// )
///
/// // Customize strings globally
/// StringsSet.setStrings(CustomStringsSet());
/// ```
abstract class StringsSet {
  static var _strings = const StringsSetModel();

  /// Generic error message
  static String get somethingWentWrong => _strings.somethingWentWrong;

  /// OK button text
  static String get ok => _strings.ok;

  /// Image selection prompt
  static String get selectImageFrom => _strings.selectImageFrom;

  /// Gallery option text
  static String get gallery => _strings.gallery;

  /// Camera option text
  static String get camera => _strings.camera;

  /// Sets the global string set
  ///
  /// [strings] - Custom string set model to use globally
  static void setStrings(StringsSetModel strings) => _strings = strings;
}
