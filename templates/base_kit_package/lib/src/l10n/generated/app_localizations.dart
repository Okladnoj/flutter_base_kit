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

  /// No description provided for @continueWithEmail.
  ///
  /// In en, this message translates to:
  /// **'Continue with Email'**
  String get continueWithEmail;

  /// No description provided for @continueWithApple.
  ///
  /// In en, this message translates to:
  /// **'Continue with Apple'**
  String get continueWithApple;

  /// No description provided for @continueWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Continue with Google'**
  String get continueWithGoogle;

  /// No description provided for @connectionsForGenz.
  ///
  /// In en, this message translates to:
  /// **'connections for genz by genz'**
  String get connectionsForGenz;

  /// No description provided for @emailAddress.
  ///
  /// In en, this message translates to:
  /// **'Email Address'**
  String get emailAddress;

  /// No description provided for @sendMagicLink.
  ///
  /// In en, this message translates to:
  /// **'Send Magic Link'**
  String get sendMagicLink;

  /// No description provided for @weSentAMagic.
  ///
  /// In en, this message translates to:
  /// **'We sent a magic link to the email'**
  String get weSentAMagic;

  /// No description provided for @goToYourEmail.
  ///
  /// In en, this message translates to:
  /// **'Go to your email and tap the link to sign you in.'**
  String get goToYourEmail;

  /// No description provided for @openMailApp.
  ///
  /// In en, this message translates to:
  /// **'Open Mail App'**
  String get openMailApp;

  /// No description provided for @resendLink.
  ///
  /// In en, this message translates to:
  /// **'Resend link'**
  String get resendLink;

  /// No description provided for @resendCode.
  ///
  /// In en, this message translates to:
  /// **'Resend code in {value} seconds...'**
  String resendCode(int value);

  /// No description provided for @respectCode.
  ///
  /// In en, this message translates to:
  /// **'Respect Code'**
  String get respectCode;

  /// No description provided for @theseCommunityGuideLinesWill.
  ///
  /// In en, this message translates to:
  /// **'These community guidelines will help understand what it means to be a member of Promly. Your use of the Promly app is dependent on your following basic terms of use and being respectful to  your fellow users. Promly was created fro GenZ by GenZ to be a supportive place to connect with others. \nWe are constantly evolving so we encourage you to share your ideas'**
  String get theseCommunityGuideLinesWill;

  /// No description provided for @iAgreeToPromlyIs.
  ///
  /// In en, this message translates to:
  /// **'I agree to Promly ‘s terms and conditions'**
  String get iAgreeToPromlyIs;

  /// No description provided for @iAmBetween.
  ///
  /// In en, this message translates to:
  /// **'I am between  13-19 years old.'**
  String get iAmBetween;

  /// No description provided for @iAgree.
  ///
  /// In en, this message translates to:
  /// **'I agree'**
  String get iAgree;

  /// No description provided for @bySigningUpYou.
  ///
  /// In en, this message translates to:
  /// **'By signing up, you agree to the'**
  String get bySigningUpYou;

  /// No description provided for @termsAndConditions.
  ///
  /// In en, this message translates to:
  /// **'terms and conditions'**
  String get termsAndConditions;

  /// No description provided for @and.
  ///
  /// In en, this message translates to:
  /// **'and'**
  String get and;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'privacy policy'**
  String get privacyPolicy;

  /// No description provided for @interests.
  ///
  /// In en, this message translates to:
  /// **'Interests'**
  String get interests;

  /// No description provided for @promlyMatchesYou.
  ///
  /// In en, this message translates to:
  /// **'Promly matches you to your peers based on the things you like.'**
  String get promlyMatchesYou;

  /// No description provided for @selectAtLeast.
  ///
  /// In en, this message translates to:
  /// **'Select at least 5.'**
  String get selectAtLeast;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @enterLinkAfterOpened.
  ///
  /// In en, this message translates to:
  /// **'Enter Link after opened'**
  String get enterLinkAfterOpened;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @profileInfo.
  ///
  /// In en, this message translates to:
  /// **'Profile Info'**
  String get profileInfo;

  /// No description provided for @addAPhoto.
  ///
  /// In en, this message translates to:
  /// **'add a photo'**
  String get addAPhoto;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @userName.
  ///
  /// In en, this message translates to:
  /// **'@username'**
  String get userName;

  /// No description provided for @birthday.
  ///
  /// In en, this message translates to:
  /// **'Birthday'**
  String get birthday;

  /// No description provided for @bio.
  ///
  /// In en, this message translates to:
  /// **'Bio'**
  String get bio;

  /// No description provided for @characters.
  ///
  /// In en, this message translates to:
  /// **'{number} characters'**
  String characters(int number);

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

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @afterSchoolClubs.
  ///
  /// In en, this message translates to:
  /// **'After School Clubs'**
  String get afterSchoolClubs;

  /// No description provided for @connectWithCool.
  ///
  /// In en, this message translates to:
  /// **'Connect with cool, like-minded peeps'**
  String get connectWithCool;

  /// No description provided for @inviteYourContacts.
  ///
  /// In en, this message translates to:
  /// **'Invite Your Contacts'**
  String get inviteYourContacts;

  /// No description provided for @done.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// No description provided for @inviteSMS.
  ///
  /// In en, this message translates to:
  /// **'Hi there! I wanted to invite you to join me on Promly. It\'s a really cool platform and I think you\'d really enjoy it. There\'s so much to explore and connect with others. Plus, it\'s a great way to stay in touch and keep up with what\'s going on in each other\'s lives \nAndroid:{linkAndroid}\niOS{linkIos}'**
  String inviteSMS(String linkAndroid, String linkIos);

  /// No description provided for @invite.
  ///
  /// In en, this message translates to:
  /// **'Invite'**
  String get invite;

  /// No description provided for @feed.
  ///
  /// In en, this message translates to:
  /// **'Feed'**
  String get feed;

  /// No description provided for @connect.
  ///
  /// In en, this message translates to:
  /// **'Connect'**
  String get connect;

  /// No description provided for @explore.
  ///
  /// In en, this message translates to:
  /// **'Explore'**
  String get explore;

  /// No description provided for @activity.
  ///
  /// In en, this message translates to:
  /// **'Activity'**
  String get activity;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @sheHer.
  ///
  /// In en, this message translates to:
  /// **'(She/Her)'**
  String get sheHer;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @levelPoints.
  ///
  /// In en, this message translates to:
  /// **'Level {level} - {points} points'**
  String levelPoints(int level, int points);

  /// No description provided for @myDay.
  ///
  /// In en, this message translates to:
  /// **'My Day'**
  String get myDay;

  /// No description provided for @more.
  ///
  /// In en, this message translates to:
  /// **'more'**
  String get more;

  /// No description provided for @twentyByTwenty.
  ///
  /// In en, this message translates to:
  /// **'20by20'**
  String get twentyByTwenty;

  /// No description provided for @makeYourTwentyByTwenty.
  ///
  /// In en, this message translates to:
  /// **'make your 20by20'**
  String get makeYourTwentyByTwenty;

  /// No description provided for @myList.
  ///
  /// In en, this message translates to:
  /// **'My List'**
  String get myList;

  /// No description provided for @addATask.
  ///
  /// In en, this message translates to:
  /// **'add a task'**
  String get addATask;

  /// No description provided for @connections.
  ///
  /// In en, this message translates to:
  /// **'connections'**
  String get connections;

  /// No description provided for @connectionsUpper.
  ///
  /// In en, this message translates to:
  /// **'Connections'**
  String get connectionsUpper;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @comingSoon.
  ///
  /// In en, this message translates to:
  /// **'Coming soon'**
  String get comingSoon;

  /// No description provided for @aboutMe.
  ///
  /// In en, this message translates to:
  /// **'About Me'**
  String get aboutMe;

  /// No description provided for @age.
  ///
  /// In en, this message translates to:
  /// **'Age'**
  String get age;

  /// No description provided for @answerAtLeast.
  ///
  /// In en, this message translates to:
  /// **'Answer at least 3 things about youse'**
  String get answerAtLeast;

  /// No description provided for @userNameFirstUppercase.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get userNameFirstUppercase;

  /// No description provided for @favoriteShow.
  ///
  /// In en, this message translates to:
  /// **'Favorite show'**
  String get favoriteShow;

  /// No description provided for @favoriteArtist.
  ///
  /// In en, this message translates to:
  /// **'Favorite artist'**
  String get favoriteArtist;

  /// No description provided for @favoriteMusic.
  ///
  /// In en, this message translates to:
  /// **'Favorite music'**
  String get favoriteMusic;

  /// No description provided for @favoriteMovieGenre.
  ///
  /// In en, this message translates to:
  /// **'Favorite movie genre'**
  String get favoriteMovieGenre;

  /// No description provided for @dreamDestination.
  ///
  /// In en, this message translates to:
  /// **'Dream destination'**
  String get dreamDestination;

  /// No description provided for @careerGoal.
  ///
  /// In en, this message translates to:
  /// **'Career goal'**
  String get careerGoal;

  /// No description provided for @editProfile.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get editProfile;

  /// No description provided for @changePhoto.
  ///
  /// In en, this message translates to:
  /// **'change photo'**
  String get changePhoto;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @aboutPromly.
  ///
  /// In en, this message translates to:
  /// **'About Promly'**
  String get aboutPromly;

  /// No description provided for @deleteAccount.
  ///
  /// In en, this message translates to:
  /// **'Delete Account'**
  String get deleteAccount;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @respectText.
  ///
  /// In en, this message translates to:
  /// **'These community guidelines will help understand what it means to be a member of Promly. Your use of the Promly app is dependent on your following basic terms of use and being respectful to  your fellow users. Promly was created fro GenZ by GenZ to be a supportive place to connect with others. \n\nWe are constantly evolving so we encourage you to share your ideas about things you’d like to see and improvements you might make to the Promly app. There are many places for you to share your voice throughout the app. We are all in this together and we are glad you are here.\n\nYour use of Promly app is subject to these Community guidelines and Terms of Use:\n\n• Respect the copyrights of others. Don\'t use other users\' personal photos and pass them as your own.\n\n• Don\'t show any nudity or upload content that is illegal or prohibited. Only content that is considered \"safe\" can be uploaded.\n\n• Do not use any profanity or discriminative language (such as disability discrimination, sexual orientation, religious discrimination, sexual orientation, religious discrimination, sexual harassment, race, color and sex). \n\n• Chat content is automatically moderated as \"safe\" or \"restricted\" using content moderation filters. Any content classified as \"restricted\" will be automatically banned.\n\n• If other users find your content or your profile inappropriate, they will flag it and we\'ll take necessary actions: such as removal of your content or deactivating your profile. We hope this app fosters more genuine connections and allows people to share their authentic selves.'**
  String get respectText;

  /// No description provided for @ourCredo.
  ///
  /// In en, this message translates to:
  /// **'Our Credo'**
  String get ourCredo;

  /// No description provided for @ourCredoText.
  ///
  /// In en, this message translates to:
  /// **'The Promly Credo: We believe our first responsibility is to GenZ and the Alpha Generation behind them. We must work together using a multigenerational approach to be sure the voice and needs of the under-18 generation are heard, validated, and responded to.\n\nWe will foster connectedness through our programs and in our work environment recognizing that human connectedness drives happiness. We will provide an inclusive online platform and services for our users reflecting diversity. We will also strive to provide a workplace that respects diversity, and as employers, will seek to value individuality and accommodate individual employees’ needs.\n\nPromly pledges to partner with organizations that also value GenZ, not as a commodity, but as people, that care about long-term outcomes, and demonstrate a commitment to destigmatize mental health and/or to create other social benefits appropriate for kids and teens. We and our business partners will have the opportunity to create a positive impact, and we require that they meaningfully demonstrate their ability to set and maintain high standards, especially with regards to minors, and that they value their reputation above profit. Promly will secure business partners that agree to provide a valued service, skills training and/or knowledge.\n\nWhere a partner engages in marketing, the organization must follow all applicable laws and best practices for minors and also that are applicable to the product. Our partners should strive to not only meet minimum requirements, but to set standards in their dealings with their clients and our users. This is essential, because trust is difficult to win, and easy to lose.\n\nIn order to maintain our users’ trust, Promly will strive to ensure that our tech-enabled solution partners prioritize the security and safety of our users. We will complement the ongoing process of platform enhancement with the continuous improvement of user protections.\n\nPromly commits to being a model of responsible technology, a driver of social impact and social enterprise, and a leader and change agent in the field of teen mental health and social media.'**
  String get ourCredoText;

  /// No description provided for @oneByTwoDay.
  ///
  /// In en, this message translates to:
  /// **'1by2day'**
  String get oneByTwoDay;

  /// No description provided for @article.
  ///
  /// In en, this message translates to:
  /// **'articles'**
  String get article;

  /// No description provided for @videos.
  ///
  /// In en, this message translates to:
  /// **'videos'**
  String get videos;

  /// No description provided for @podcast.
  ///
  /// In en, this message translates to:
  /// **'podcasts'**
  String get podcast;

  /// No description provided for @myDayType.
  ///
  /// In en, this message translates to:
  /// **'my day'**
  String get myDayType;

  /// No description provided for @event.
  ///
  /// In en, this message translates to:
  /// **'events'**
  String get event;

  /// No description provided for @challenge.
  ///
  /// In en, this message translates to:
  /// **'challenges'**
  String get challenge;

  /// No description provided for @userChallenge.
  ///
  /// In en, this message translates to:
  /// **'user challenges'**
  String get userChallenge;

  /// No description provided for @promly.
  ///
  /// In en, this message translates to:
  /// **'Promly'**
  String get promly;

  /// No description provided for @earnPoints.
  ///
  /// In en, this message translates to:
  /// **'Earn: {points} points'**
  String earnPoints(int points);

  /// No description provided for @accept.
  ///
  /// In en, this message translates to:
  /// **'Accept'**
  String get accept;

  /// No description provided for @sendMessage.
  ///
  /// In en, this message translates to:
  /// **'Send a message...'**
  String get sendMessage;

  /// No description provided for @checkOutThese.
  ///
  /// In en, this message translates to:
  /// **'Check out these {count} new profiles for you'**
  String checkOutThese(int count);

  /// No description provided for @seeProfiles.
  ///
  /// In en, this message translates to:
  /// **'See Profiles'**
  String get seeProfiles;

  /// No description provided for @nextProfile.
  ///
  /// In en, this message translates to:
  /// **'Next Profile'**
  String get nextProfile;

  /// No description provided for @sendFriendRequest.
  ///
  /// In en, this message translates to:
  /// **'Send Friend Request'**
  String get sendFriendRequest;

  /// No description provided for @youAreAllCaught.
  ///
  /// In en, this message translates to:
  /// **'You\'re All Caught Up!'**
  String get youAreAllCaught;

  /// No description provided for @youHaveReviewed.
  ///
  /// In en, this message translates to:
  /// **'You\'ve reviewed all available profiles for today.'**
  String get youHaveReviewed;

  /// No description provided for @wantToSeeMoreProfiles.
  ///
  /// In en, this message translates to:
  /// **'Want to see more profiles?'**
  String get wantToSeeMoreProfiles;

  /// No description provided for @useYourPoints.
  ///
  /// In en, this message translates to:
  /// **'Use your points to unlock them!'**
  String get useYourPoints;

  /// No description provided for @earnPointsByCompleting.
  ///
  /// In en, this message translates to:
  /// **'Earn points by completing challenges.'**
  String get earnPointsByCompleting;

  /// No description provided for @yourCurrentBalance.
  ///
  /// In en, this message translates to:
  /// **'Your current balance: {points} points'**
  String yourCurrentBalance(int points);

  /// No description provided for @unlockMoreProfiles.
  ///
  /// In en, this message translates to:
  /// **'Unlock more Profiles'**
  String get unlockMoreProfiles;

  /// No description provided for @unlock.
  ///
  /// In en, this message translates to:
  /// **'Unlock'**
  String get unlock;

  /// No description provided for @unlockProfilesWithPoints.
  ///
  /// In en, this message translates to:
  /// **'Unlock Profiles with Points'**
  String get unlockProfilesWithPoints;

  /// No description provided for @enterTheNumberOfProfiles.
  ///
  /// In en, this message translates to:
  /// **'Enter the number of profiles you\'d like to unlock'**
  String get enterTheNumberOfProfiles;

  /// No description provided for @numberOfProfiles.
  ///
  /// In en, this message translates to:
  /// **'Number of profiles'**
  String get numberOfProfiles;

  /// No description provided for @thisWillCostYou.
  ///
  /// In en, this message translates to:
  /// **'This will cost you: {points} points'**
  String thisWillCostYou(int points);

  /// No description provided for @purchaseSuccessful.
  ///
  /// In en, this message translates to:
  /// **'Purchase Successful!'**
  String get purchaseSuccessful;

  /// No description provided for @youHaveUnlocked.
  ///
  /// In en, this message translates to:
  /// **'You have unlocked 2 new profiles!'**
  String get youHaveUnlocked;

  /// No description provided for @startExploringThemNow.
  ///
  /// In en, this message translates to:
  /// **'Start exploring them now!'**
  String get startExploringThemNow;

  /// No description provided for @challengeAccepted.
  ///
  /// In en, this message translates to:
  /// **'Challenge accepted!'**
  String get challengeAccepted;

  /// No description provided for @seeMyGoals.
  ///
  /// In en, this message translates to:
  /// **'See My Goals'**
  String get seeMyGoals;

  /// No description provided for @readTheArticle.
  ///
  /// In en, this message translates to:
  /// **'Read the Article'**
  String get readTheArticle;

  /// No description provided for @listenToPodcast.
  ///
  /// In en, this message translates to:
  /// **'Listen to Podcast'**
  String get listenToPodcast;

  /// No description provided for @watchTheVideo.
  ///
  /// In en, this message translates to:
  /// **'Watch the Video'**
  String get watchTheVideo;

  /// No description provided for @viewMyGoal.
  ///
  /// In en, this message translates to:
  /// **'View My Goal'**
  String get viewMyGoal;

  /// No description provided for @viewGoal.
  ///
  /// In en, this message translates to:
  /// **'View Goal'**
  String get viewGoal;

  /// No description provided for @myGoals.
  ///
  /// In en, this message translates to:
  /// **'My goals'**
  String get myGoals;

  /// No description provided for @promlyGoals.
  ///
  /// In en, this message translates to:
  /// **'Promly goals'**
  String get promlyGoals;

  /// No description provided for @complete.
  ///
  /// In en, this message translates to:
  /// **'Complete'**
  String get complete;

  /// No description provided for @challengeSubmission.
  ///
  /// In en, this message translates to:
  /// **'Challenge Submission'**
  String get challengeSubmission;

  /// No description provided for @submitTheProof.
  ///
  /// In en, this message translates to:
  /// **'Submit the proof of your challenge completion. Select a format that you’d like to use.'**
  String get submitTheProof;

  /// No description provided for @text.
  ///
  /// In en, this message translates to:
  /// **'Text'**
  String get text;

  /// No description provided for @image.
  ///
  /// In en, this message translates to:
  /// **'Image'**
  String get image;

  /// No description provided for @video.
  ///
  /// In en, this message translates to:
  /// **'Video'**
  String get video;

  /// No description provided for @addAVideo.
  ///
  /// In en, this message translates to:
  /// **'add a video'**
  String get addAVideo;

  /// No description provided for @submit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// No description provided for @postAboutThings.
  ///
  /// In en, this message translates to:
  /// **'Post about 3 things you’re grateful for today'**
  String get postAboutThings;

  /// No description provided for @challengeCompleted.
  ///
  /// In en, this message translates to:
  /// **'Challenge completed!'**
  String get challengeCompleted;

  /// No description provided for @youEarned.
  ///
  /// In en, this message translates to:
  /// **'You earned {points} points'**
  String youEarned(int points);

  /// No description provided for @congratulations.
  ///
  /// In en, this message translates to:
  /// **'Congratulations!'**
  String get congratulations;

  /// No description provided for @youHaveAchieved.
  ///
  /// In en, this message translates to:
  /// **'You have achieved Level {level}'**
  String youHaveAchieved(int level);

  /// No description provided for @oneProfileEqualsTo.
  ///
  /// In en, this message translates to:
  /// **'{counts} profile equals to {points} points'**
  String oneProfileEqualsTo(int counts, int points);

  /// No description provided for @cameraPermissionNotGranted.
  ///
  /// In en, this message translates to:
  /// **'Camera permission not granted!'**
  String get cameraPermissionNotGranted;

  /// No description provided for @upload.
  ///
  /// In en, this message translates to:
  /// **'Upload'**
  String get upload;

  /// No description provided for @unavailableLink.
  ///
  /// In en, this message translates to:
  /// **'Unavailable link: \"{linkPath}\"'**
  String unavailableLink(Object? linkPath);

  /// No description provided for @report.
  ///
  /// In en, this message translates to:
  /// **'Report'**
  String get report;

  /// No description provided for @tellUsWhy.
  ///
  /// In en, this message translates to:
  /// **'Tell us why you are reporting this.'**
  String get tellUsWhy;

  /// No description provided for @sendReport.
  ///
  /// In en, this message translates to:
  /// **'Send Report'**
  String get sendReport;

  /// No description provided for @hustle.
  ///
  /// In en, this message translates to:
  /// **'Hustle'**
  String get hustle;

  /// No description provided for @serve.
  ///
  /// In en, this message translates to:
  /// **'Serve'**
  String get serve;

  /// No description provided for @earn.
  ///
  /// In en, this message translates to:
  /// **'Earn'**
  String get earn;

  /// No description provided for @learn.
  ///
  /// In en, this message translates to:
  /// **'Learn'**
  String get learn;

  /// No description provided for @create.
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get create;

  /// No description provided for @published.
  ///
  /// In en, this message translates to:
  /// **'published'**
  String get published;

  /// No description provided for @archived.
  ///
  /// In en, this message translates to:
  /// **'archived'**
  String get archived;

  /// No description provided for @draft.
  ///
  /// In en, this message translates to:
  /// **'draft'**
  String get draft;

  /// No description provided for @none.
  ///
  /// In en, this message translates to:
  /// **'N/a'**
  String get none;

  /// No description provided for @hustlesIsEmpty.
  ///
  /// In en, this message translates to:
  /// **'hustles is empty'**
  String get hustlesIsEmpty;

  /// No description provided for @weGotYou.
  ///
  /// In en, this message translates to:
  /// **'We Got You'**
  String get weGotYou;

  /// No description provided for @talkToSomeone.
  ///
  /// In en, this message translates to:
  /// **'Talk to someone'**
  String get talkToSomeone;

  /// No description provided for @helpMeFeelBetter.
  ///
  /// In en, this message translates to:
  /// **'Help me feel better'**
  String get helpMeFeelBetter;

  /// No description provided for @anxietyReduxNow.
  ///
  /// In en, this message translates to:
  /// **'Anxiety redux now'**
  String get anxietyReduxNow;

  /// No description provided for @immediateHelp.
  ///
  /// In en, this message translates to:
  /// **'Immediate help!'**
  String get immediateHelp;

  /// No description provided for @iDLikeToTalk.
  ///
  /// In en, this message translates to:
  /// **'I’d like to talk to someone'**
  String get iDLikeToTalk;

  /// No description provided for @stressedOut.
  ///
  /// In en, this message translates to:
  /// **'Stressed out?'**
  String get stressedOut;

  /// No description provided for @call.
  ///
  /// In en, this message translates to:
  /// **'Call'**
  String get call;

  /// No description provided for @helpMe.
  ///
  /// In en, this message translates to:
  /// **'help me'**
  String get helpMe;

  /// No description provided for @suicidePrevention.
  ///
  /// In en, this message translates to:
  /// **'Suicide prevention hotline'**
  String get suicidePrevention;

  /// No description provided for @crisisTextLine.
  ///
  /// In en, this message translates to:
  /// **'Crisis text line'**
  String get crisisTextLine;

  /// No description provided for @chat.
  ///
  /// In en, this message translates to:
  /// **'Chat'**
  String get chat;

  /// No description provided for @myDaySubmission.
  ///
  /// In en, this message translates to:
  /// **'MyDay Submission'**
  String get myDaySubmission;

  /// No description provided for @shareAPartOfYour.
  ///
  /// In en, this message translates to:
  /// **'Share a part of your day. It can be a highlight, can be low point. Just keep it real'**
  String get shareAPartOfYour;

  /// No description provided for @myDaIsBeing.
  ///
  /// In en, this message translates to:
  /// **'MyDay is being uploaded'**
  String get myDaIsBeing;

  /// No description provided for @isBeing.
  ///
  /// In en, this message translates to:
  /// **'{date} is being uploaded'**
  String isBeing(String date);

  /// No description provided for @thanksForSharing.
  ///
  /// In en, this message translates to:
  /// **'Thanks for sharing your day\'s highlights with us. Check the Feed soon for your post.'**
  String get thanksForSharing;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @selectImageFrom.
  ///
  /// In en, this message translates to:
  /// **'Select Image From'**
  String get selectImageFrom;

  /// No description provided for @selectImageSourceContent.
  ///
  /// In en, this message translates to:
  /// **'Choose where to get your image from'**
  String get selectImageSourceContent;

  /// No description provided for @gallery.
  ///
  /// In en, this message translates to:
  /// **'Gallery'**
  String get gallery;

  /// No description provided for @camera.
  ///
  /// In en, this message translates to:
  /// **'Camera'**
  String get camera;

  /// No description provided for @accepted.
  ///
  /// In en, this message translates to:
  /// **'accepted'**
  String get accepted;

  /// No description provided for @pending.
  ///
  /// In en, this message translates to:
  /// **'pending'**
  String get pending;

  /// No description provided for @today.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get today;

  /// No description provided for @yesterday.
  ///
  /// In en, this message translates to:
  /// **'Yesterday'**
  String get yesterday;

  /// No description provided for @findFriends.
  ///
  /// In en, this message translates to:
  /// **'Find Friends'**
  String get findFriends;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @cancelUpper.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancelUpper;

  /// No description provided for @requested.
  ///
  /// In en, this message translates to:
  /// **'requested'**
  String get requested;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'add'**
  String get add;

  /// No description provided for @addUpper.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get addUpper;

  /// No description provided for @surpriseMe.
  ///
  /// In en, this message translates to:
  /// **'Surprise Me'**
  String get surpriseMe;

  /// No description provided for @adventure.
  ///
  /// In en, this message translates to:
  /// **'Adventure'**
  String get adventure;

  /// No description provided for @activism.
  ///
  /// In en, this message translates to:
  /// **'Activism'**
  String get activism;

  /// No description provided for @books.
  ///
  /// In en, this message translates to:
  /// **'Books'**
  String get books;

  /// No description provided for @entertainment.
  ///
  /// In en, this message translates to:
  /// **'Entertainment'**
  String get entertainment;

  /// No description provided for @finance.
  ///
  /// In en, this message translates to:
  /// **'Finance'**
  String get finance;

  /// No description provided for @food.
  ///
  /// In en, this message translates to:
  /// **'Food'**
  String get food;

  /// No description provided for @lifestyle.
  ///
  /// In en, this message translates to:
  /// **'Lifestyle'**
  String get lifestyle;

  /// No description provided for @mental.
  ///
  /// In en, this message translates to:
  /// **'Mental Health'**
  String get mental;

  /// No description provided for @music.
  ///
  /// In en, this message translates to:
  /// **'Music'**
  String get music;

  /// No description provided for @my.
  ///
  /// In en, this message translates to:
  /// **'My Picks'**
  String get my;

  /// No description provided for @resources.
  ///
  /// In en, this message translates to:
  /// **'Resources'**
  String get resources;

  /// No description provided for @social.
  ///
  /// In en, this message translates to:
  /// **'Social'**
  String get social;

  /// No description provided for @socialEvents.
  ///
  /// In en, this message translates to:
  /// **'Social Events'**
  String get socialEvents;

  /// No description provided for @sports.
  ///
  /// In en, this message translates to:
  /// **'Sports'**
  String get sports;

  /// No description provided for @stem.
  ///
  /// In en, this message translates to:
  /// **'STEM'**
  String get stem;

  /// No description provided for @travel.
  ///
  /// In en, this message translates to:
  /// **'Travel'**
  String get travel;

  /// No description provided for @unknown.
  ///
  /// In en, this message translates to:
  /// **'Unknown'**
  String get unknown;

  /// No description provided for @refresh.
  ///
  /// In en, this message translates to:
  /// **'Refresh'**
  String get refresh;

  /// No description provided for @listen.
  ///
  /// In en, this message translates to:
  /// **'Listen'**
  String get listen;

  /// No description provided for @setAGoal.
  ///
  /// In en, this message translates to:
  /// **'Set a goal:'**
  String get setAGoal;

  /// No description provided for @set.
  ///
  /// In en, this message translates to:
  /// **'set'**
  String get set;

  /// No description provided for @created.
  ///
  /// In en, this message translates to:
  /// **'Created {date}'**
  String created(String date);

  /// No description provided for @markAsCompleted.
  ///
  /// In en, this message translates to:
  /// **'Mark as Completed'**
  String get markAsCompleted;

  /// No description provided for @editGoal.
  ///
  /// In en, this message translates to:
  /// **'Edit Goal'**
  String get editGoal;

  /// No description provided for @deleteGoal.
  ///
  /// In en, this message translates to:
  /// **'Delete Goal'**
  String get deleteGoal;

  /// No description provided for @onlyMe.
  ///
  /// In en, this message translates to:
  /// **'Only Me'**
  String get onlyMe;

  /// No description provided for @friendsCanSee.
  ///
  /// In en, this message translates to:
  /// **'Friends Can See'**
  String get friendsCanSee;

  /// No description provided for @promlyNetwork.
  ///
  /// In en, this message translates to:
  /// **'Promly Network'**
  String get promlyNetwork;

  /// No description provided for @open.
  ///
  /// In en, this message translates to:
  /// **'Open'**
  String get open;

  /// No description provided for @calibrationText.
  ///
  /// In en, this message translates to:
  /// **'Calibration'**
  String get calibrationText;

  /// No description provided for @placeAndHold.
  ///
  /// In en, this message translates to:
  /// **'Place and hold your index finger over your camera'**
  String get placeAndHold;

  /// No description provided for @keepYourFingerOn.
  ///
  /// In en, this message translates to:
  /// **'Keep your finger on the camera. The calibration takes up to 30 sec'**
  String get keepYourFingerOn;

  /// No description provided for @detected.
  ///
  /// In en, this message translates to:
  /// **'Detected'**
  String get detected;

  /// No description provided for @undetected.
  ///
  /// In en, this message translates to:
  /// **'Undetected'**
  String get undetected;

  /// No description provided for @ohNo.
  ///
  /// In en, this message translates to:
  /// **'Oh No!'**
  String get ohNo;

  /// No description provided for @itLooksLikeWe.
  ///
  /// In en, this message translates to:
  /// **'It looks like we don’t have permission to access you camera'**
  String get itLooksLikeWe;

  /// No description provided for @goToAppSettingsTo.
  ///
  /// In en, this message translates to:
  /// **'Go to app settings to allow access to camera and start the calibration.'**
  String get goToAppSettingsTo;

  /// No description provided for @goToSettings.
  ///
  /// In en, this message translates to:
  /// **'Go To Settings'**
  String get goToSettings;

  /// No description provided for @bpm.
  ///
  /// In en, this message translates to:
  /// **'{value} bpm'**
  String bpm(int value);

  /// No description provided for @heartRate.
  ///
  /// In en, this message translates to:
  /// **'{value} Heart Rate'**
  String heartRate(String value);

  /// No description provided for @hide.
  ///
  /// In en, this message translates to:
  /// **'Hide'**
  String get hide;

  /// No description provided for @show.
  ///
  /// In en, this message translates to:
  /// **'Show'**
  String get show;

  /// No description provided for @scanningHeartRate.
  ///
  /// In en, this message translates to:
  /// **'Scanning Heart Rate'**
  String get scanningHeartRate;

  /// No description provided for @keepYourFinger.
  ///
  /// In en, this message translates to:
  /// **'Keep your finger on the camera'**
  String get keepYourFinger;

  /// No description provided for @time.
  ///
  /// In en, this message translates to:
  /// **'TIME'**
  String get time;

  /// No description provided for @duringPanicOurBodies.
  ///
  /// In en, this message translates to:
  /// **'During panic, our bodies hyperventilate to bring in more oxygen and our heart rates elevate so that we can fight or run away to best survive the threat.'**
  String get duringPanicOurBodies;

  /// No description provided for @finishTracking.
  ///
  /// In en, this message translates to:
  /// **'Finish Tracking'**
  String get finishTracking;

  /// No description provided for @shareDetails.
  ///
  /// In en, this message translates to:
  /// **'Share details'**
  String get shareDetails;

  /// No description provided for @weAreCollectingAnonymous.
  ///
  /// In en, this message translates to:
  /// **'We’re collecting anonymous data to develop a cutting-edge anxiety attack prediction algorithm.'**
  String get weAreCollectingAnonymous;

  /// No description provided for @howDoYouFeelNow.
  ///
  /// In en, this message translates to:
  /// **'How do you feel now?'**
  String get howDoYouFeelNow;

  /// No description provided for @rateYouAnxietyAttack.
  ///
  /// In en, this message translates to:
  /// **'Rate you anxiety attack'**
  String get rateYouAnxietyAttack;

  /// No description provided for @didYouHaveAtLeast.
  ///
  /// In en, this message translates to:
  /// **'Did you have at least 8 hours of sleep?'**
  String get didYouHaveAtLeast;

  /// No description provided for @didYouConsumeAnyEnergy.
  ///
  /// In en, this message translates to:
  /// **'Did you consume any energy drinks today?'**
  String get didYouConsumeAnyEnergy;

  /// No description provided for @didYouConsumeCaffeineToday.
  ///
  /// In en, this message translates to:
  /// **'Did you consume caffeine today?'**
  String get didYouConsumeCaffeineToday;

  /// No description provided for @low.
  ///
  /// In en, this message translates to:
  /// **'Low'**
  String get low;

  /// No description provided for @normal.
  ///
  /// In en, this message translates to:
  /// **'Normal'**
  String get normal;

  /// No description provided for @high.
  ///
  /// In en, this message translates to:
  /// **'High'**
  String get high;

  /// No description provided for @summary.
  ///
  /// In en, this message translates to:
  /// **'Summary'**
  String get summary;

  /// No description provided for @heartRateText.
  ///
  /// In en, this message translates to:
  /// **'Heart Rate'**
  String get heartRateText;

  /// No description provided for @yourRestingHeartRate.
  ///
  /// In en, this message translates to:
  /// **'Your resting heart rate is the lowest amount of blood your heart pumps when you are not physically active. It is typically between 60 and 100 beats per minute when you are relaxed, calm, and in good health while sitting or lying down.'**
  String get yourRestingHeartRate;

  /// No description provided for @duration.
  ///
  /// In en, this message translates to:
  /// **'Duration'**
  String get duration;

  /// No description provided for @recentAttack.
  ///
  /// In en, this message translates to:
  /// **'RECENT ATTACK'**
  String get recentAttack;

  /// No description provided for @anxietyAttacksUsuallyLastForAbout.
  ///
  /// In en, this message translates to:
  /// **'Anxiety attacks usually last for about 30 minutes, and the intensity of symptoms usually increases in the middle of the attack. Recognizing triggers that lead to anxiety is important, as it can accumulate for hours or even days before an attack, which can help in preventing or managing them.'**
  String get anxietyAttacksUsuallyLastForAbout;

  /// No description provided for @seeCopingStrategies.
  ///
  /// In en, this message translates to:
  /// **'See Coping Strategies'**
  String get seeCopingStrategies;

  /// No description provided for @finish.
  ///
  /// In en, this message translates to:
  /// **'Finish'**
  String get finish;

  /// No description provided for @letIsChat.
  ///
  /// In en, this message translates to:
  /// **'Let’s Chat'**
  String get letIsChat;

  /// No description provided for @readArticle.
  ///
  /// In en, this message translates to:
  /// **'Read Article'**
  String get readArticle;

  /// No description provided for @checkItOut.
  ///
  /// In en, this message translates to:
  /// **'Check it Out'**
  String get checkItOut;

  /// No description provided for @watchVideo.
  ///
  /// In en, this message translates to:
  /// **'Watch Video'**
  String get watchVideo;

  /// No description provided for @spinMe.
  ///
  /// In en, this message translates to:
  /// **'Spin Me'**
  String get spinMe;

  /// No description provided for @inCollabWith.
  ///
  /// In en, this message translates to:
  /// **'In collab with'**
  String get inCollabWith;

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

  /// No description provided for @promlyHasPartneredWithYoti.
  ///
  /// In en, this message translates to:
  /// **'Promly has partnered with Yoti\nto ensure the safety\nof the platform.'**
  String get promlyHasPartneredWithYoti;

  /// No description provided for @continueToProceedWithThe.
  ///
  /// In en, this message translates to:
  /// **'Continue to proceed with the age verification process. Don’t worry this will take just a minute and your privacy is guaranteed.'**
  String get continueToProceedWithThe;

  /// No description provided for @continueButton.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueButton;

  /// No description provided for @placeHeadInFrame.
  ///
  /// In en, this message translates to:
  /// **'Place head in frame'**
  String get placeHeadInFrame;

  /// No description provided for @byContinueYouAgreeTo.
  ///
  /// In en, this message translates to:
  /// **'By continuing, you agree to have your age estimated by our partner Yoti. Your photo will  then be deleted immediately and not used for any other purpose.'**
  String get byContinueYouAgreeTo;

  /// No description provided for @verificationComplete.
  ///
  /// In en, this message translates to:
  /// **'Verification Complete'**
  String get verificationComplete;

  /// No description provided for @yourAgeHasBeenVerified.
  ///
  /// In en, this message translates to:
  /// **'Your age has been verified.\nConnect with friends now.'**
  String get yourAgeHasBeenVerified;

  /// No description provided for @letsGo.
  ///
  /// In en, this message translates to:
  /// **'Let’s go!'**
  String get letsGo;

  /// No description provided for @oopsSomethingWentWrong.
  ///
  /// In en, this message translates to:
  /// **'Oops, something went wrong.'**
  String get oopsSomethingWentWrong;

  /// No description provided for @ageVerificationHasFailed.
  ///
  /// In en, this message translates to:
  /// **'Age verification has failed.\nIf this is a mistake, please contact us.'**
  String get ageVerificationHasFailed;

  /// No description provided for @contactUs.
  ///
  /// In en, this message translates to:
  /// **'Contact us'**
  String get contactUs;

  /// No description provided for @tryAgain.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get tryAgain;

  /// No description provided for @yourChallengeIsBeingUploaded.
  ///
  /// In en, this message translates to:
  /// **'Your challenge is being uploaded'**
  String get yourChallengeIsBeingUploaded;

  /// No description provided for @yourContentDidNotMeetAll.
  ///
  /// In en, this message translates to:
  /// **'Your content didn\'t meet all our guidelines, so it\'s not posted yet. An admin will review it shortly.'**
  String get yourContentDidNotMeetAll;

  /// No description provided for @reject.
  ///
  /// In en, this message translates to:
  /// **'reject'**
  String get reject;

  /// No description provided for @youAreAllCaughtUp.
  ///
  /// In en, this message translates to:
  /// **'You\'re all caught up! No new notifications right now.'**
  String get youAreAllCaughtUp;

  /// No description provided for @challengeComplete.
  ///
  /// In en, this message translates to:
  /// **'Challenge Complete!'**
  String get challengeComplete;

  /// No description provided for @level.
  ///
  /// In en, this message translates to:
  /// **'Level {date}'**
  String level(int date);
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
