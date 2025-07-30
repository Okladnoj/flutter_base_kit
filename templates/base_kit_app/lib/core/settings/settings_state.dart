import 'package:flutter/material.dart';
import 'package:flutter_base_kit/flutter_base_kit.dart';
import 'package:injectable/injectable.dart';

import '../../gen/fonts.gen.dart';
import '../../l10n/localization_helper.dart';
import '../../services/storage/fonts/fonts_service.dart';
import '../../services/storage/locale/locale_service.dart';
import '../../services/storage/theme/theme_service.dart';
import '../../themes/app_theme.dart';

@singleton
class SettingsState extends BaseProvider {
  final LocaleService _localeService;
  final ThemeService _themeService;
  final FontsService _fontsService;

  SettingsState(
    this._localeService,
    this._themeService,
    this._fontsService,
  );

  Locale locale = appLocale;
  ThemeType themeType = ThemeType.dark;
  String? fontFamily;
  double textScaleFactor = 1;

  Future<void> init() async {
    locale = _localeService.getLocale();
    themeType = _themeService.getTheme() ?? themeType;
    fontFamily = _fontsService.getFontFamily() ?? FontFamily.nunito;
    notifyListeners();
  }

  Future<void> changeLanguage(Locale locale) async {
    this.locale = locale;
    notifyListeners();
    await _localeService.saveLocale(locale);
  }

  Future<void> changeTheme(ThemeType themeType) async {
    this.themeType = themeType;
    notifyListeners();
    await _themeService.saveTheme(themeType);
  }

  Future<void> switchTheme() async {
    themeType = themeType == ThemeType.dark ? ThemeType.light : ThemeType.dark;
    notifyListeners();
    await _themeService.saveTheme(themeType);
  }

  Future<void> changeFontFamily(String fontFamily) async {
    this.fontFamily = fontFamily;
    notifyListeners();
    await _fontsService.saveFontFamily(fontFamily);
  }

  Future<void> changeFontSize(double textScaleFactor) async {
    this.textScaleFactor = textScaleFactor;
    notifyListeners();
    // await _localeService.saveLocale(locale);
  }
}
