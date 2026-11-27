import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
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
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

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
  static const List<Locale> supportedLocales = <Locale>[Locale('ar'), Locale('en')];

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @getStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getStarted;

  /// No description provided for @onboarding1Title.
  ///
  /// In en, this message translates to:
  /// **'Discover Your Path'**
  String get onboarding1Title;

  /// No description provided for @onboarding1Desc.
  ///
  /// In en, this message translates to:
  /// **'Explore top bootcamps from leading training companies.'**
  String get onboarding1Desc;

  /// No description provided for @onboarding2Title.
  ///
  /// In en, this message translates to:
  /// **'Learn & Grow'**
  String get onboarding2Title;

  /// No description provided for @onboarding2Desc.
  ///
  /// In en, this message translates to:
  /// **'Attend sessions, complete tasks, and track your progress.'**
  String get onboarding2Desc;

  /// No description provided for @onboarding3Title.
  ///
  /// In en, this message translates to:
  /// **'Achieve More'**
  String get onboarding3Title;

  /// No description provided for @onboarding3Desc.
  ///
  /// In en, this message translates to:
  /// **'Earn badges, climb the leaderboard, and reach new heights.'**
  String get onboarding3Desc;

  /// No description provided for @homeYourPath.
  ///
  /// In en, this message translates to:
  /// **'Your Path to Success'**
  String get homeYourPath;

  /// No description provided for @homeWelcomeBack.
  ///
  /// In en, this message translates to:
  /// **'Welcome back!'**
  String get homeWelcomeBack;

  /// No description provided for @homeTagline.
  ///
  /// In en, this message translates to:
  /// **'Keep going, your success is closer\nthan you think!'**
  String get homeTagline;

  /// No description provided for @homeJourneyTitle.
  ///
  /// In en, this message translates to:
  /// **'YOUR LEARNING JOURNEY'**
  String get homeJourneyTitle;

  /// No description provided for @homeDuration.
  ///
  /// In en, this message translates to:
  /// **'DURATION'**
  String get homeDuration;

  /// No description provided for @homeDeadline.
  ///
  /// In en, this message translates to:
  /// **'DEADLINE'**
  String get homeDeadline;

  /// No description provided for @homeProgress.
  ///
  /// In en, this message translates to:
  /// **'PROGRESS'**
  String get homeProgress;

  /// No description provided for @homeNextLesson.
  ///
  /// In en, this message translates to:
  /// **'NEXT LESSON'**
  String get homeNextLesson;

  /// No description provided for @homeContinue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get homeContinue;

  /// No description provided for @homeQuizzes.
  ///
  /// In en, this message translates to:
  /// **'Quizzes'**
  String get homeQuizzes;

  /// No description provided for @homeQuizzesSub.
  ///
  /// In en, this message translates to:
  /// **'Test your knowledge'**
  String get homeQuizzesSub;

  /// No description provided for @homeProjects.
  ///
  /// In en, this message translates to:
  /// **'Projects'**
  String get homeProjects;

  /// No description provided for @homeProjectsSub.
  ///
  /// In en, this message translates to:
  /// **'Build & Learn'**
  String get homeProjectsSub;

  /// No description provided for @homeCode.
  ///
  /// In en, this message translates to:
  /// **'Code'**
  String get homeCode;

  /// No description provided for @homeCodeSub.
  ///
  /// In en, this message translates to:
  /// **'Practice'**
  String get homeCodeSub;

  /// No description provided for @homeGetHelp.
  ///
  /// In en, this message translates to:
  /// **'Get Help'**
  String get homeGetHelp;

  /// No description provided for @homeGetHelpSub.
  ///
  /// In en, this message translates to:
  /// **'Ask Experts'**
  String get homeGetHelpSub;

  /// No description provided for @homeNextSession.
  ///
  /// In en, this message translates to:
  /// **'Next Session'**
  String get homeNextSession;

  /// No description provided for @homeSeeAll.
  ///
  /// In en, this message translates to:
  /// **'See All'**
  String get homeSeeAll;

  /// No description provided for @homeJoin.
  ///
  /// In en, this message translates to:
  /// **'Join'**
  String get homeJoin;

  /// No description provided for @homeUrgent.
  ///
  /// In en, this message translates to:
  /// **'Urgent Submissions'**
  String get homeUrgent;

  /// No description provided for @homeNewCount.
  ///
  /// In en, this message translates to:
  /// **'{count} New'**
  String homeNewCount(int count);

  /// No description provided for @homeWeekly.
  ///
  /// In en, this message translates to:
  /// **'Weekly Schedule & Activity'**
  String get homeWeekly;

  /// No description provided for @homeViewDetails.
  ///
  /// In en, this message translates to:
  /// **'View Details'**
  String get homeViewDetails;

  /// No description provided for @homeLessons.
  ///
  /// In en, this message translates to:
  /// **'Lessons'**
  String get homeLessons;

  /// No description provided for @homeTotalTime.
  ///
  /// In en, this message translates to:
  /// **'Total Time'**
  String get homeTotalTime;

  /// No description provided for @homeThisWeek.
  ///
  /// In en, this message translates to:
  /// **'This Week'**
  String get homeThisWeek;

  /// No description provided for @homeCompletedCount.
  ///
  /// In en, this message translates to:
  /// **'{count} Completed'**
  String homeCompletedCount(int count);

  /// No description provided for @homeRecommended.
  ///
  /// In en, this message translates to:
  /// **'Recommended Next Track'**
  String get homeRecommended;

  /// No description provided for @homeExploreAll.
  ///
  /// In en, this message translates to:
  /// **'Explore All'**
  String get homeExploreAll;

  /// No description provided for @homeAchievements.
  ///
  /// In en, this message translates to:
  /// **'Achievements & Milestones'**
  String get homeAchievements;

  /// No description provided for @homeViewAll.
  ///
  /// In en, this message translates to:
  /// **'View All'**
  String get homeViewAll;

  /// No description provided for @homeGreat.
  ///
  /// In en, this message translates to:
  /// **'You\'re doing great!'**
  String get homeGreat;

  /// No description provided for @homeKeepLearning.
  ///
  /// In en, this message translates to:
  /// **'Keep learning to unlock more achievements.'**
  String get homeKeepLearning;

  /// No description provided for @homeWorkshopTitle.
  ///
  /// In en, this message translates to:
  /// **'Join our next workshop!'**
  String get homeWorkshopTitle;

  /// No description provided for @homeContinueLearning.
  ///
  /// In en, this message translates to:
  /// **'Continue Learning →'**
  String get homeContinueLearning;

  /// No description provided for @homeDayMon.
  ///
  /// In en, this message translates to:
  /// **'MON'**
  String get homeDayMon;

  /// No description provided for @homeDayTue.
  ///
  /// In en, this message translates to:
  /// **'TUE'**
  String get homeDayTue;

  /// No description provided for @homeDayWed.
  ///
  /// In en, this message translates to:
  /// **'WED'**
  String get homeDayWed;

  /// No description provided for @homeDayThu.
  ///
  /// In en, this message translates to:
  /// **'THU'**
  String get homeDayThu;

  /// No description provided for @homeDayFri.
  ///
  /// In en, this message translates to:
  /// **'FRI'**
  String get homeDayFri;

  /// No description provided for @homeDaySat.
  ///
  /// In en, this message translates to:
  /// **'SAT'**
  String get homeDaySat;

  /// No description provided for @homeDaySun.
  ///
  /// In en, this message translates to:
  /// **'SUN'**
  String get homeDaySun;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
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
