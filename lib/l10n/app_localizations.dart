import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_bn.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
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
    Locale('bn'),
    Locale('en'),
  ];

  /// The name of the application
  ///
  /// In bn, this message translates to:
  /// **'শেখার বোর্ড'**
  String get appName;

  /// Loading indicator text
  ///
  /// In bn, this message translates to:
  /// **'লোড হচ্ছে...'**
  String get loading;

  /// Language selection title
  ///
  /// In bn, this message translates to:
  /// **'ভাষা নির্বাচন করুন'**
  String get selectLanguage;

  /// Bengali language option
  ///
  /// In bn, this message translates to:
  /// **'বাংলা'**
  String get languageBangla;

  /// English language option
  ///
  /// In bn, this message translates to:
  /// **'English'**
  String get languageEnglish;

  /// Language selection hint text
  ///
  /// In bn, this message translates to:
  /// **'আপনার পছন্দের ভাষা নির্বাচন করুন'**
  String get languageSelectionHint;

  /// Welcome text on splash screen
  ///
  /// In bn, this message translates to:
  /// **'স্বাগতম!'**
  String get splashWelcome;

  /// App tagline - Learn through play
  ///
  /// In bn, this message translates to:
  /// **'শিখি খেলার ছলে'**
  String get splashTagline;

  /// Welcome screen title
  ///
  /// In bn, this message translates to:
  /// **'স্বাগতম!'**
  String get welcomeTitle;

  /// Welcome screen subtitle
  ///
  /// In bn, this message translates to:
  /// **'শিখি খেলার ছলে'**
  String get welcomeSubtitle;

  /// Welcome invitation message
  ///
  /// In bn, this message translates to:
  /// **'আসুন একসাথে মজার জগতে প্রবেশ করি!'**
  String get welcomeMessage;

  /// Start learning button text
  ///
  /// In bn, this message translates to:
  /// **'শুরু করি!'**
  String get startLearning;

  /// Tutorial screen title - How to learn
  ///
  /// In bn, this message translates to:
  /// **'কিভাবে শিখবো?'**
  String get tutorialTitle;

  /// Tutorial step 1 - Touch the picture
  ///
  /// In bn, this message translates to:
  /// **'ছবিতে টাচ করো'**
  String get tutorialStep1;

  /// Tutorial step 2 - Hear the name
  ///
  /// In bn, this message translates to:
  /// **'নাম শোনো'**
  String get tutorialStep2;

  /// Tutorial step 3 - Have fun
  ///
  /// In bn, this message translates to:
  /// **'মজা করো!'**
  String get tutorialStep3;

  /// Tutorial start button
  ///
  /// In bn, this message translates to:
  /// **'শুরু করি!'**
  String get tutorialStart;

  /// Skip tutorial button
  ///
  /// In bn, this message translates to:
  /// **'এড়িয়ে যাই'**
  String get tutorialSkip;

  /// Main learning board title
  ///
  /// In bn, this message translates to:
  /// **'শিখি খেলার ছলে!'**
  String get mainBoardTitle;

  /// Animals category
  ///
  /// In bn, this message translates to:
  /// **'পশু-পাখি'**
  String get categoryAnimals;

  /// Fruits category
  ///
  /// In bn, this message translates to:
  /// **'ফলমূল'**
  String get categoryFruits;

  /// Vegetables category
  ///
  /// In bn, this message translates to:
  /// **'সবজি'**
  String get categoryVegetables;

  /// Numbers category
  ///
  /// In bn, this message translates to:
  /// **'সংখ্যা'**
  String get categoryNumbers;

  /// Colors category
  ///
  /// In bn, this message translates to:
  /// **'রং'**
  String get categoryColors;

  /// Shapes category
  ///
  /// In bn, this message translates to:
  /// **'আকৃতি'**
  String get categoryShapes;

  /// Bengali letters category
  ///
  /// In bn, this message translates to:
  /// **'বর্ণমালা'**
  String get categoryLettersBn;

  /// English letters category
  ///
  /// In bn, this message translates to:
  /// **'ABC'**
  String get categoryLettersEn;

  /// Body parts category
  ///
  /// In bn, this message translates to:
  /// **'শরীরের অংশ'**
  String get categoryBody;

  /// Family category
  ///
  /// In bn, this message translates to:
  /// **'পরিবার'**
  String get categoryFamily;

  /// Vehicles category
  ///
  /// In bn, this message translates to:
  /// **'যানবাহন'**
  String get categoryVehicles;

  /// Food category
  ///
  /// In bn, this message translates to:
  /// **'খাবার'**
  String get categoryFood;

  /// Error screen title
  ///
  /// In bn, this message translates to:
  /// **'ওহ! কিছু ভুল হয়েছে'**
  String get errorTitle;

  /// Error screen message
  ///
  /// In bn, this message translates to:
  /// **'চিন্তা করো না, আবার চেষ্টা করি!'**
  String get errorMessage;

  /// Retry button text
  ///
  /// In bn, this message translates to:
  /// **'আবার চেষ্টা করি'**
  String get errorRetry;

  /// Go home button text
  ///
  /// In bn, this message translates to:
  /// **'বাড়ি যাই'**
  String get errorGoHome;

  /// Settings screen title
  ///
  /// In bn, this message translates to:
  /// **'সেটিংস'**
  String get settingsTitle;

  /// Language setting
  ///
  /// In bn, this message translates to:
  /// **'ভাষা'**
  String get settingsLanguage;

  /// Voice setting
  ///
  /// In bn, this message translates to:
  /// **'কণ্ঠস্বর'**
  String get settingsVoice;

  /// Male voice option
  ///
  /// In bn, this message translates to:
  /// **'পুরুষ কণ্ঠ'**
  String get settingsVoiceMale;

  /// Female voice option
  ///
  /// In bn, this message translates to:
  /// **'মহিলা কণ্ঠ'**
  String get settingsVoiceFemale;

  /// Cartoon/Anime voice option
  ///
  /// In bn, this message translates to:
  /// **'কার্টুন কণ্ঠ'**
  String get settingsVoiceAnime;

  /// Parent gate title
  ///
  /// In bn, this message translates to:
  /// **'অভিভাবক যাচাই'**
  String get parentGateTitle;

  /// Parent gate message - For adults only
  ///
  /// In bn, this message translates to:
  /// **'শুধুমাত্র বড়দের জন্য'**
  String get parentGateMessage;

  /// Parent gate instruction
  ///
  /// In bn, this message translates to:
  /// **'সমস্যাটি সমাধান করুন'**
  String get parentGateQuestion;

  /// Next button
  ///
  /// In bn, this message translates to:
  /// **'পরবর্তী'**
  String get buttonNext;

  /// Back button
  ///
  /// In bn, this message translates to:
  /// **'পিছনে'**
  String get buttonBack;

  /// Done button
  ///
  /// In bn, this message translates to:
  /// **'হয়ে গেছে'**
  String get buttonDone;

  /// Cancel button
  ///
  /// In bn, this message translates to:
  /// **'বাতিল'**
  String get buttonCancel;

  /// OK button
  ///
  /// In bn, this message translates to:
  /// **'ঠিক আছে'**
  String get buttonOk;
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
      <String>['bn', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'bn':
      return AppLocalizationsBn();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
