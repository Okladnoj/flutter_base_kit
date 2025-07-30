import 'dart:ui';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../l10n/localization_helper.dart';

@injectable
class LocaleService {
  static const _localeKey = 'keyShrPrefLocale';
  final SharedPreferences _storage;

  const LocaleService(this._storage);

  Future<void> saveLocale(Locale locale) async {
    appLocale = locale;
    await _storage.setString(_localeKey, locale.languageCode);
  }

  Locale getLocale() {
    final locale = _getLocale();
    appLocale = locale;
    return locale;
  }

  Locale _getLocale() {
    final codeLocale = _storage.getString(_localeKey);

    if (codeLocale == null) return supportedLocale;

    return Locale(codeLocale);
  }
}
