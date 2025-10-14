import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es')
  ];

  /// No description provided for @flag.
  ///
  /// In en, this message translates to:
  /// **'🇬🇧'**
  String get flag;

  /// No description provided for @languages.
  ///
  /// In en, this message translates to:
  /// **'Languages'**
  String get languages;

  /// No description provided for @languageName.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get languageName;

  /// No description provided for @fonts.
  ///
  /// In en, this message translates to:
  /// **'Fonts'**
  String get fonts;

  /// No description provided for @serverErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'Server error occurred'**
  String get serverErrorMessage;

  /// No description provided for @errorInternetConnection.
  ///
  /// In en, this message translates to:
  /// **'Internet Connection Error'**
  String get errorInternetConnection;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @theme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// No description provided for @light.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get light;

  /// No description provided for @dark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get dark;

  /// No description provided for @system.
  ///
  /// In en, this message translates to:
  /// **'Use device settings'**
  String get system;

  /// No description provided for @oops.
  ///
  /// In en, this message translates to:
  /// **'Ooops...'**
  String get oops;

  /// No description provided for @somethingWentWrong.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong. Try again later or update the screen'**
  String get somethingWentWrong;

  /// No description provided for @weakPassword.
  ///
  /// In en, this message translates to:
  /// **'The password provided is too weak.'**
  String get weakPassword;

  /// No description provided for @emailAlreadyInUse.
  ///
  /// In en, this message translates to:
  /// **'The account already exists for that email.'**
  String get emailAlreadyInUse;

  /// No description provided for @userNotFound.
  ///
  /// In en, this message translates to:
  /// **'No user found for that email.'**
  String get userNotFound;

  /// No description provided for @invalidCredential.
  ///
  /// In en, this message translates to:
  /// **'Incorrect email or password. Please try again or register an account with this email.'**
  String get invalidCredential;

  /// No description provided for @wrongPassword.
  ///
  /// In en, this message translates to:
  /// **'Wrong password provided for that user.'**
  String get wrongPassword;

  /// No description provided for @noneAuthException.
  ///
  /// In en, this message translates to:
  /// **'Incorrect credential'**
  String get noneAuthException;

  /// No description provided for @fieldErrorPasswordNumbers.
  ///
  /// In en, this message translates to:
  /// **'Password must be include numbers'**
  String get fieldErrorPasswordNumbers;

  /// No description provided for @fieldErrorPasswordRegex.
  ///
  /// In en, this message translates to:
  /// **'Valid characters: \"A-Z, a-z, 0-9\"'**
  String get fieldErrorPasswordRegex;

  /// No description provided for @fieldErrorPasswordMatch.
  ///
  /// In en, this message translates to:
  /// **'*Passwords need to match. Please try again.'**
  String get fieldErrorPasswordMatch;

  /// No description provided for @fieldMustNotEmpty.
  ///
  /// In en, this message translates to:
  /// **'Field must not be empty'**
  String get fieldMustNotEmpty;

  /// No description provided for @incorrectEmail.
  ///
  /// In en, this message translates to:
  /// **'Incorrect email'**
  String get incorrectEmail;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'confirm'**
  String get confirm;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'cancel'**
  String get cancel;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @verification.
  ///
  /// In en, this message translates to:
  /// **'Verification'**
  String get verification;

  /// No description provided for @startPage.
  ///
  /// In en, this message translates to:
  /// **'Start Page'**
  String get startPage;

  /// No description provided for @crashLogs.
  ///
  /// In en, this message translates to:
  /// **'Crash Logs'**
  String get crashLogs;

  /// No description provided for @viewCrashLogs.
  ///
  /// In en, this message translates to:
  /// **'View crash logs'**
  String get viewCrashLogs;

  /// No description provided for @noCrashLogsFound.
  ///
  /// In en, this message translates to:
  /// **'No crash logs found'**
  String get noCrashLogsFound;

  /// No description provided for @exportLogs.
  ///
  /// In en, this message translates to:
  /// **'Export Logs'**
  String get exportLogs;

  /// No description provided for @clearLogs.
  ///
  /// In en, this message translates to:
  /// **'Clear Logs'**
  String get clearLogs;

  /// No description provided for @confirmClearLogs.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to clear crash logs?'**
  String get confirmClearLogs;

  /// No description provided for @logsExported.
  ///
  /// In en, this message translates to:
  /// **'Logs exported successfully'**
  String get logsExported;

  /// No description provided for @logsCleared.
  ///
  /// In en, this message translates to:
  /// **'Logs cleared successfully'**
  String get logsCleared;

  /// No description provided for @appLogs.
  ///
  /// In en, this message translates to:
  /// **'App Logs'**
  String get appLogs;

  /// No description provided for @viewAppLogs.
  ///
  /// In en, this message translates to:
  /// **'View app logs'**
  String get viewAppLogs;

  /// No description provided for @noAppLogsFound.
  ///
  /// In en, this message translates to:
  /// **'No app logs found'**
  String get noAppLogsFound;

  /// No description provided for @confirmClearAppLogs.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to clear app logs?'**
  String get confirmClearAppLogs;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
