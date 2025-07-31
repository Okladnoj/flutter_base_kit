// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get flag => '🇬🇧';

  @override
  String get languages => 'Languages';

  @override
  String get languageName => 'English';

  @override
  String get fonts => 'Fonts';

  @override
  String get serverErrorMessage => 'Server error occurred';

  @override
  String get errorInternetConnection => 'Internet Connection Error';

  @override
  String get theme => 'Theme';

  @override
  String get light => 'Light';

  @override
  String get dark => 'Dark';

  @override
  String get oops => 'Ooops...';

  @override
  String get somethingWentWrong => 'Something went wrong. Try again later or update the screen';

  @override
  String get weakPassword => 'The password provided is too weak.';

  @override
  String get emailAlreadyInUse => 'The account already exists for that email.';

  @override
  String get userNotFound => 'No user found for that email.';

  @override
  String get invalidCredential => 'Incorrect email or password. Please try again or register an account with this email.';

  @override
  String get wrongPassword => 'Wrong password provided for that user.';

  @override
  String get noneAuthException => 'Incorrect credential';

  @override
  String get fieldErrorPasswordNumbers => 'Password must be include numbers';

  @override
  String get fieldErrorPasswordRegex => 'Valid characters: \"A-Z, a-z, 0-9\"';

  @override
  String get fieldErrorPasswordMatch => '*Passwords need to match. Please try again.';

  @override
  String get fieldMustNotEmpty => 'Field must not be empty';

  @override
  String get incorrectEmail => 'Incorrect email';

  @override
  String get continueWithEmail => 'Continue with Email';

  @override
  String get continueWithApple => 'Continue with Apple';

  @override
  String get continueWithGoogle => 'Continue with Google';

  @override
  String get connectionsForGenz => 'connections for genz by genz';

  @override
  String get emailAddress => 'Email Address';

  @override
  String get sendMagicLink => 'Send Magic Link';

  @override
  String get weSentAMagic => 'We sent a magic link to the email';

  @override
  String get goToYourEmail => 'Go to your email and tap the link to sign you in.';

  @override
  String get openMailApp => 'Open Mail App';

  @override
  String get resendLink => 'Resend link';

  @override
  String resendCode(int value) {
    return 'Resend code in $value seconds...';
  }

  @override
  String get respectCode => 'Respect Code';

  @override
  String get theseCommunityGuideLinesWill => 'These community guidelines will help understand what it means to be a member of Promly. Your use of the Promly app is dependent on your following basic terms of use and being respectful to  your fellow users. Promly was created fro GenZ by GenZ to be a supportive place to connect with others. \nWe are constantly evolving so we encourage you to share your ideas';

  @override
  String get iAgreeToPromlyIs => 'I agree to Promly ‘s terms and conditions';

  @override
  String get iAmBetween => 'I am between  13-19 years old.';

  @override
  String get iAgree => 'I agree';

  @override
  String get bySigningUpYou => 'By signing up, you agree to the';

  @override
  String get termsAndConditions => 'terms and conditions';

  @override
  String get and => 'and';

  @override
  String get privacyPolicy => 'privacy policy';

  @override
  String get interests => 'Interests';

  @override
  String get promlyMatchesYou => 'Promly matches you to your peers based on the things you like.';

  @override
  String get selectAtLeast => 'Select at least 5.';

  @override
  String get next => 'Next';

  @override
  String get enterLinkAfterOpened => 'Enter Link after opened';

  @override
  String get login => 'Login';

  @override
  String get profileInfo => 'Profile Info';

  @override
  String get addAPhoto => 'add a photo';

  @override
  String get name => 'Name';

  @override
  String get userName => '@username';

  @override
  String get birthday => 'Birthday';

  @override
  String get bio => 'Bio';

  @override
  String characters(int number) {
    return '$number characters';
  }

  @override
  String get confirm => 'confirm';

  @override
  String get cancel => 'cancel';

  @override
  String get skip => 'Skip';

  @override
  String get afterSchoolClubs => 'After School Clubs';

  @override
  String get connectWithCool => 'Connect with cool, like-minded peeps';

  @override
  String get inviteYourContacts => 'Invite Your Contacts';

  @override
  String get done => 'Done';

  @override
  String inviteSMS(String linkAndroid, String linkIos) {
    return 'Hi there! I wanted to invite you to join me on Promly. It\'s a really cool platform and I think you\'d really enjoy it. There\'s so much to explore and connect with others. Plus, it\'s a great way to stay in touch and keep up with what\'s going on in each other\'s lives \nAndroid:$linkAndroid\niOS$linkIos';
  }

  @override
  String get invite => 'Invite';

  @override
  String get feed => 'Feed';

  @override
  String get connect => 'Connect';

  @override
  String get explore => 'Explore';

  @override
  String get activity => 'Activity';

  @override
  String get profile => 'Profile';

  @override
  String get sheHer => '(She/Her)';

  @override
  String get edit => 'Edit';

  @override
  String levelPoints(int level, int points) {
    return 'Level $level - $points points';
  }

  @override
  String get myDay => 'My Day';

  @override
  String get more => 'more';

  @override
  String get twentyByTwenty => '20by20';

  @override
  String get makeYourTwentyByTwenty => 'make your 20by20';

  @override
  String get myList => 'My List';

  @override
  String get addATask => 'add a task';

  @override
  String get connections => 'connections';

  @override
  String get connectionsUpper => 'Connections';

  @override
  String get save => 'Save';

  @override
  String get comingSoon => 'Coming soon';

  @override
  String get aboutMe => 'About Me';

  @override
  String get age => 'Age';

  @override
  String get answerAtLeast => 'Answer at least 3 things about youse';

  @override
  String get userNameFirstUppercase => 'Username';

  @override
  String get favoriteShow => 'Favorite show';

  @override
  String get favoriteArtist => 'Favorite artist';

  @override
  String get favoriteMusic => 'Favorite music';

  @override
  String get favoriteMovieGenre => 'Favorite movie genre';

  @override
  String get dreamDestination => 'Dream destination';

  @override
  String get careerGoal => 'Career goal';

  @override
  String get editProfile => 'Edit Profile';

  @override
  String get changePhoto => 'change photo';

  @override
  String get notifications => 'Notifications';

  @override
  String get aboutPromly => 'About Promly';

  @override
  String get deleteAccount => 'Delete Account';

  @override
  String get logout => 'Logout';

  @override
  String get respectText => 'These community guidelines will help understand what it means to be a member of Promly. Your use of the Promly app is dependent on your following basic terms of use and being respectful to  your fellow users. Promly was created fro GenZ by GenZ to be a supportive place to connect with others. \n\nWe are constantly evolving so we encourage you to share your ideas about things you’d like to see and improvements you might make to the Promly app. There are many places for you to share your voice throughout the app. We are all in this together and we are glad you are here.\n\nYour use of Promly app is subject to these Community guidelines and Terms of Use:\n\n• Respect the copyrights of others. Don\'t use other users\' personal photos and pass them as your own.\n\n• Don\'t show any nudity or upload content that is illegal or prohibited. Only content that is considered \"safe\" can be uploaded.\n\n• Do not use any profanity or discriminative language (such as disability discrimination, sexual orientation, religious discrimination, sexual orientation, religious discrimination, sexual harassment, race, color and sex). \n\n• Chat content is automatically moderated as \"safe\" or \"restricted\" using content moderation filters. Any content classified as \"restricted\" will be automatically banned.\n\n• If other users find your content or your profile inappropriate, they will flag it and we\'ll take necessary actions: such as removal of your content or deactivating your profile. We hope this app fosters more genuine connections and allows people to share their authentic selves.';

  @override
  String get ourCredo => 'Our Credo';

  @override
  String get ourCredoText => 'The Promly Credo: We believe our first responsibility is to GenZ and the Alpha Generation behind them. We must work together using a multigenerational approach to be sure the voice and needs of the under-18 generation are heard, validated, and responded to.\n\nWe will foster connectedness through our programs and in our work environment recognizing that human connectedness drives happiness. We will provide an inclusive online platform and services for our users reflecting diversity. We will also strive to provide a workplace that respects diversity, and as employers, will seek to value individuality and accommodate individual employees’ needs.\n\nPromly pledges to partner with organizations that also value GenZ, not as a commodity, but as people, that care about long-term outcomes, and demonstrate a commitment to destigmatize mental health and/or to create other social benefits appropriate for kids and teens. We and our business partners will have the opportunity to create a positive impact, and we require that they meaningfully demonstrate their ability to set and maintain high standards, especially with regards to minors, and that they value their reputation above profit. Promly will secure business partners that agree to provide a valued service, skills training and/or knowledge.\n\nWhere a partner engages in marketing, the organization must follow all applicable laws and best practices for minors and also that are applicable to the product. Our partners should strive to not only meet minimum requirements, but to set standards in their dealings with their clients and our users. This is essential, because trust is difficult to win, and easy to lose.\n\nIn order to maintain our users’ trust, Promly will strive to ensure that our tech-enabled solution partners prioritize the security and safety of our users. We will complement the ongoing process of platform enhancement with the continuous improvement of user protections.\n\nPromly commits to being a model of responsible technology, a driver of social impact and social enterprise, and a leader and change agent in the field of teen mental health and social media.';

  @override
  String get oneByTwoDay => '1by2day';

  @override
  String get article => 'articles';

  @override
  String get videos => 'videos';

  @override
  String get podcast => 'podcasts';

  @override
  String get myDayType => 'my day';

  @override
  String get event => 'events';

  @override
  String get challenge => 'challenges';

  @override
  String get userChallenge => 'user challenges';

  @override
  String get promly => 'Promly';

  @override
  String earnPoints(int points) {
    return 'Earn: $points points';
  }

  @override
  String get accept => 'Accept';

  @override
  String get sendMessage => 'Send a message...';

  @override
  String checkOutThese(int count) {
    return 'Check out these $count new profiles for you';
  }

  @override
  String get seeProfiles => 'See Profiles';

  @override
  String get nextProfile => 'Next Profile';

  @override
  String get sendFriendRequest => 'Send Friend Request';

  @override
  String get youAreAllCaught => 'You\'re All Caught Up!';

  @override
  String get youHaveReviewed => 'You\'ve reviewed all available profiles for today.';

  @override
  String get wantToSeeMoreProfiles => 'Want to see more profiles?';

  @override
  String get useYourPoints => 'Use your points to unlock them!';

  @override
  String get earnPointsByCompleting => 'Earn points by completing challenges.';

  @override
  String yourCurrentBalance(int points) {
    return 'Your current balance: $points points';
  }

  @override
  String get unlockMoreProfiles => 'Unlock more Profiles';

  @override
  String get unlock => 'Unlock';

  @override
  String get unlockProfilesWithPoints => 'Unlock Profiles with Points';

  @override
  String get enterTheNumberOfProfiles => 'Enter the number of profiles you\'d like to unlock';

  @override
  String get numberOfProfiles => 'Number of profiles';

  @override
  String thisWillCostYou(int points) {
    return 'This will cost you: $points points';
  }

  @override
  String get purchaseSuccessful => 'Purchase Successful!';

  @override
  String get youHaveUnlocked => 'You have unlocked 2 new profiles!';

  @override
  String get startExploringThemNow => 'Start exploring them now!';

  @override
  String get challengeAccepted => 'Challenge accepted!';

  @override
  String get seeMyGoals => 'See My Goals';

  @override
  String get readTheArticle => 'Read the Article';

  @override
  String get listenToPodcast => 'Listen to Podcast';

  @override
  String get watchTheVideo => 'Watch the Video';

  @override
  String get viewMyGoal => 'View My Goal';

  @override
  String get viewGoal => 'View Goal';

  @override
  String get myGoals => 'My goals';

  @override
  String get promlyGoals => 'Promly goals';

  @override
  String get complete => 'Complete';

  @override
  String get challengeSubmission => 'Challenge Submission';

  @override
  String get submitTheProof => 'Submit the proof of your challenge completion. Select a format that you’d like to use.';

  @override
  String get text => 'Text';

  @override
  String get image => 'Image';

  @override
  String get video => 'Video';

  @override
  String get addAVideo => 'add a video';

  @override
  String get submit => 'Submit';

  @override
  String get postAboutThings => 'Post about 3 things you’re grateful for today';

  @override
  String get challengeCompleted => 'Challenge completed!';

  @override
  String youEarned(int points) {
    return 'You earned $points points';
  }

  @override
  String get congratulations => 'Congratulations!';

  @override
  String youHaveAchieved(int level) {
    return 'You have achieved Level $level';
  }

  @override
  String oneProfileEqualsTo(int counts, int points) {
    return '$counts profile equals to $points points';
  }

  @override
  String get cameraPermissionNotGranted => 'Camera permission not granted!';

  @override
  String get upload => 'Upload';

  @override
  String unavailableLink(Object? linkPath) {
    return 'Unavailable link: \"$linkPath\"';
  }

  @override
  String get report => 'Report';

  @override
  String get tellUsWhy => 'Tell us why you are reporting this.';

  @override
  String get sendReport => 'Send Report';

  @override
  String get hustle => 'Hustle';

  @override
  String get serve => 'Serve';

  @override
  String get earn => 'Earn';

  @override
  String get learn => 'Learn';

  @override
  String get create => 'Create';

  @override
  String get published => 'published';

  @override
  String get archived => 'archived';

  @override
  String get draft => 'draft';

  @override
  String get none => 'N/a';

  @override
  String get hustlesIsEmpty => 'hustles is empty';

  @override
  String get weGotYou => 'We Got You';

  @override
  String get talkToSomeone => 'Talk to someone';

  @override
  String get helpMeFeelBetter => 'Help me feel better';

  @override
  String get anxietyReduxNow => 'Anxiety redux now';

  @override
  String get immediateHelp => 'Immediate help!';

  @override
  String get iDLikeToTalk => 'I’d like to talk to someone';

  @override
  String get stressedOut => 'Stressed out?';

  @override
  String get call => 'Call';

  @override
  String get helpMe => 'help me';

  @override
  String get suicidePrevention => 'Suicide prevention hotline';

  @override
  String get crisisTextLine => 'Crisis text line';

  @override
  String get chat => 'Chat';

  @override
  String get myDaySubmission => 'MyDay Submission';

  @override
  String get shareAPartOfYour => 'Share a part of your day. It can be a highlight, can be low point. Just keep it real';

  @override
  String get myDaIsBeing => 'MyDay is being uploaded';

  @override
  String isBeing(String date) {
    return '$date is being uploaded';
  }

  @override
  String get thanksForSharing => 'Thanks for sharing your day\'s highlights with us. Check the Feed soon for your post.';

  @override
  String get settings => 'Settings';

  @override
  String get selectImageFrom => 'Select Image From';

  @override
  String get selectImageSourceContent => 'Choose where to get your image from';

  @override
  String get gallery => 'Gallery';

  @override
  String get camera => 'Camera';

  @override
  String get accepted => 'accepted';

  @override
  String get pending => 'pending';

  @override
  String get today => 'Today';

  @override
  String get yesterday => 'Yesterday';

  @override
  String get findFriends => 'Find Friends';

  @override
  String get search => 'Search';

  @override
  String get cancelUpper => 'Cancel';

  @override
  String get requested => 'requested';

  @override
  String get add => 'add';

  @override
  String get addUpper => 'Add';

  @override
  String get surpriseMe => 'Surprise Me';

  @override
  String get adventure => 'Adventure';

  @override
  String get activism => 'Activism';

  @override
  String get books => 'Books';

  @override
  String get entertainment => 'Entertainment';

  @override
  String get finance => 'Finance';

  @override
  String get food => 'Food';

  @override
  String get lifestyle => 'Lifestyle';

  @override
  String get mental => 'Mental Health';

  @override
  String get music => 'Music';

  @override
  String get my => 'My Picks';

  @override
  String get resources => 'Resources';

  @override
  String get social => 'Social';

  @override
  String get socialEvents => 'Social Events';

  @override
  String get sports => 'Sports';

  @override
  String get stem => 'STEM';

  @override
  String get travel => 'Travel';

  @override
  String get unknown => 'Unknown';

  @override
  String get refresh => 'Refresh';

  @override
  String get listen => 'Listen';

  @override
  String get setAGoal => 'Set a goal:';

  @override
  String get set => 'set';

  @override
  String created(String date) {
    return 'Created $date';
  }

  @override
  String get markAsCompleted => 'Mark as Completed';

  @override
  String get editGoal => 'Edit Goal';

  @override
  String get deleteGoal => 'Delete Goal';

  @override
  String get onlyMe => 'Only Me';

  @override
  String get friendsCanSee => 'Friends Can See';

  @override
  String get promlyNetwork => 'Promly Network';

  @override
  String get open => 'Open';

  @override
  String get calibrationText => 'Calibration';

  @override
  String get placeAndHold => 'Place and hold your index finger over your camera';

  @override
  String get keepYourFingerOn => 'Keep your finger on the camera. The calibration takes up to 30 sec';

  @override
  String get detected => 'Detected';

  @override
  String get undetected => 'Undetected';

  @override
  String get ohNo => 'Oh No!';

  @override
  String get itLooksLikeWe => 'It looks like we don’t have permission to access you camera';

  @override
  String get goToAppSettingsTo => 'Go to app settings to allow access to camera and start the calibration.';

  @override
  String get goToSettings => 'Go To Settings';

  @override
  String bpm(int value) {
    return '$value bpm';
  }

  @override
  String heartRate(String value) {
    return '$value Heart Rate';
  }

  @override
  String get hide => 'Hide';

  @override
  String get show => 'Show';

  @override
  String get scanningHeartRate => 'Scanning Heart Rate';

  @override
  String get keepYourFinger => 'Keep your finger on the camera';

  @override
  String get time => 'TIME';

  @override
  String get duringPanicOurBodies => 'During panic, our bodies hyperventilate to bring in more oxygen and our heart rates elevate so that we can fight or run away to best survive the threat.';

  @override
  String get finishTracking => 'Finish Tracking';

  @override
  String get shareDetails => 'Share details';

  @override
  String get weAreCollectingAnonymous => 'We’re collecting anonymous data to develop a cutting-edge anxiety attack prediction algorithm.';

  @override
  String get howDoYouFeelNow => 'How do you feel now?';

  @override
  String get rateYouAnxietyAttack => 'Rate you anxiety attack';

  @override
  String get didYouHaveAtLeast => 'Did you have at least 8 hours of sleep?';

  @override
  String get didYouConsumeAnyEnergy => 'Did you consume any energy drinks today?';

  @override
  String get didYouConsumeCaffeineToday => 'Did you consume caffeine today?';

  @override
  String get low => 'Low';

  @override
  String get normal => 'Normal';

  @override
  String get high => 'High';

  @override
  String get summary => 'Summary';

  @override
  String get heartRateText => 'Heart Rate';

  @override
  String get yourRestingHeartRate => 'Your resting heart rate is the lowest amount of blood your heart pumps when you are not physically active. It is typically between 60 and 100 beats per minute when you are relaxed, calm, and in good health while sitting or lying down.';

  @override
  String get duration => 'Duration';

  @override
  String get recentAttack => 'RECENT ATTACK';

  @override
  String get anxietyAttacksUsuallyLastForAbout => 'Anxiety attacks usually last for about 30 minutes, and the intensity of symptoms usually increases in the middle of the attack. Recognizing triggers that lead to anxiety is important, as it can accumulate for hours or even days before an attack, which can help in preventing or managing them.';

  @override
  String get seeCopingStrategies => 'See Coping Strategies';

  @override
  String get finish => 'Finish';

  @override
  String get letIsChat => 'Let’s Chat';

  @override
  String get readArticle => 'Read Article';

  @override
  String get checkItOut => 'Check it Out';

  @override
  String get watchVideo => 'Watch Video';

  @override
  String get spinMe => 'Spin Me';

  @override
  String get inCollabWith => 'In collab with';

  @override
  String get ok => 'OK';

  @override
  String get verification => 'Verification';

  @override
  String get promlyHasPartneredWithYoti => 'Promly has partnered with Yoti\nto ensure the safety\nof the platform.';

  @override
  String get continueToProceedWithThe => 'Continue to proceed with the age verification process. Don’t worry this will take just a minute and your privacy is guaranteed.';

  @override
  String get continueButton => 'Continue';

  @override
  String get placeHeadInFrame => 'Place head in frame';

  @override
  String get byContinueYouAgreeTo => 'By continuing, you agree to have your age estimated by our partner Yoti. Your photo will  then be deleted immediately and not used for any other purpose.';

  @override
  String get verificationComplete => 'Verification Complete';

  @override
  String get yourAgeHasBeenVerified => 'Your age has been verified.\nConnect with friends now.';

  @override
  String get letsGo => 'Let’s go!';

  @override
  String get oopsSomethingWentWrong => 'Oops, something went wrong.';

  @override
  String get ageVerificationHasFailed => 'Age verification has failed.\nIf this is a mistake, please contact us.';

  @override
  String get contactUs => 'Contact us';

  @override
  String get tryAgain => 'Try again';

  @override
  String get yourChallengeIsBeingUploaded => 'Your challenge is being uploaded';

  @override
  String get yourContentDidNotMeetAll => 'Your content didn\'t meet all our guidelines, so it\'s not posted yet. An admin will review it shortly.';

  @override
  String get reject => 'reject';

  @override
  String get youAreAllCaughtUp => 'You\'re all caught up! No new notifications right now.';

  @override
  String get challengeComplete => 'Challenge Complete!';

  @override
  String level(int date) {
    return 'Level $date';
  }
}
