import 'dart:ui';

import 'package:flutter/widgets.dart';

import 'generated/app_localizations.dart';
import 'generated/app_localizations_en.dart';

export 'generated/app_localizations.dart';

Locale appLocale = supportedLocale;
final _userLocale = PlatformDispatcher.instance.locale;
const _defaultLocale = Locale('en');
final _defaultLocalize = AppLocalizationsEn(_defaultLocale.languageCode);

Locale get supportedLocale {
  final supported = AppLocalizations.supportedLocales.any((localeSup) {
    final supCode = localeSup.languageCode.toLowerCase();
    final userCode = _userLocale.languageCode.toLowerCase();

    return supCode == userCode;
  });

  if (!supported) return _defaultLocale;

  return _userLocale;
}

AppLocalizations getLocaleLocalizations([Locale? locale]) {
  Locale? local;
  if (locale == null) {
    local = _userLocale;
  } else {
    local = locale;
  }

  final localeSupported = AppLocalizations.supportedLocales.contains(local);

  if (!localeSupported) return _defaultLocalize;

  return lookupAppLocalizations(local);
}

String getLocaleFlag(Locale locale) {
  return getLocaleLocalizations(locale).flag;
}

AppLocalizations _getLocalizations(BuildContext context) {
  final localizations = AppLocalizations.of(context);
  if (localizations != null) return localizations;
  return _defaultLocalize;
}

extension ContextExt on BuildContext {
  AppLocalizations get strings => _getLocalizations(this);

  double calculateTextWidth(String? text, TextStyle? style) {
    style ??= const TextStyle();
    text ??= '';
    final textScaler = MediaQuery.of(this).textScaler;
    final width = MediaQuery.of(this).size.width;
    final adjustedStyle = style.copyWith(
      fontSize: textScaler.scale(style.fontSize ?? 1),
    );

    final textPainter = TextPainter(
      text: TextSpan(text: text, style: adjustedStyle),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(minWidth: 0, maxWidth: width);
    if (width < 700) return textPainter.width;
    return textPainter.width + (0.4 * text.length);
  }
}

extension LocaleExt on Locale {
  AppLocalizations get localization => getLocaleLocalizations(this);
  String get name => localization.languageName;
  String get flag => localization.flag;
}
