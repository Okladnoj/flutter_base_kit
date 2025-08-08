import '../l10n/localization_helper.dart';

abstract class EmailValidator {
  static String? validator(String? value) {
    final strings = getLocaleLocalizations();
    if (value == null || value.isEmpty) {
      return strings.fieldMustNotEmpty;
    }
    if (!RegExp(_pattern).hasMatch(value)) {
      return strings.incorrectEmail;
    }
    return null;
  }

  static const _pattern = r'^[a-zA-Z0-9._\+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
}
