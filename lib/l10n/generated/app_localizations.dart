import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

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
  static const List<Locale> supportedLocales = <Locale>[Locale('en')];

  /// Application title
  ///
  /// In en, this message translates to:
  /// **'BASA AI'**
  String get appTitle;

  /// No description provided for @loginTitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome to BASA AI!'**
  String get loginTitle;

  /// No description provided for @loginLearnerTab.
  ///
  /// In en, this message translates to:
  /// **'Learner'**
  String get loginLearnerTab;

  /// No description provided for @loginTeacherTab.
  ///
  /// In en, this message translates to:
  /// **'Teacher'**
  String get loginTeacherTab;

  /// No description provided for @loginLrnHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your Learner Reference Number'**
  String get loginLrnHint;

  /// No description provided for @loginLrnLabel.
  ///
  /// In en, this message translates to:
  /// **'Learner Reference Number (LRN)'**
  String get loginLrnLabel;

  /// No description provided for @loginEnterButton.
  ///
  /// In en, this message translates to:
  /// **'Let\'s Go!'**
  String get loginEnterButton;

  /// No description provided for @loginTeacherEmailHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get loginTeacherEmailHint;

  /// No description provided for @loginTeacherEmailLabel.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get loginTeacherEmailLabel;

  /// No description provided for @loginTeacherPasswordHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get loginTeacherPasswordHint;

  /// No description provided for @loginTeacherPasswordLabel.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get loginTeacherPasswordLabel;

  /// No description provided for @loginTeacherButton.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get loginTeacherButton;

  /// No description provided for @loginBiboWelcome.
  ///
  /// In en, this message translates to:
  /// **'Hi there! I\'m Bibo. Let\'s learn to read together!'**
  String get loginBiboWelcome;

  /// No description provided for @loginBiboTeacher.
  ///
  /// In en, this message translates to:
  /// **'Welcome back, Teacher! Sign in to see your class.'**
  String get loginBiboTeacher;

  /// No description provided for @logoutTitle.
  ///
  /// In en, this message translates to:
  /// **'See You Soon!'**
  String get logoutTitle;

  /// No description provided for @logoutConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to log out?'**
  String get logoutConfirmation;

  /// No description provided for @logoutButton.
  ///
  /// In en, this message translates to:
  /// **'Log Out'**
  String get logoutButton;

  /// No description provided for @logoutCancel.
  ///
  /// In en, this message translates to:
  /// **'Stay'**
  String get logoutCancel;

  /// No description provided for @logoutBiboMessage.
  ///
  /// In en, this message translates to:
  /// **'Come back soon! We\'ll keep your progress safe.'**
  String get logoutBiboMessage;

  /// No description provided for @learnerHomeGreeting.
  ///
  /// In en, this message translates to:
  /// **'Hi, {name}!'**
  String learnerHomeGreeting(String name);

  /// No description provided for @learnerHomeTodayLesson.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Lesson'**
  String get learnerHomeTodayLesson;

  /// No description provided for @learnerHomeStartNow.
  ///
  /// In en, this message translates to:
  /// **'Start Now'**
  String get learnerHomeStartNow;

  /// No description provided for @learnerHomeGames.
  ///
  /// In en, this message translates to:
  /// **'Games'**
  String get learnerHomeGames;

  /// No description provided for @learnerHomeWordList.
  ///
  /// In en, this message translates to:
  /// **'Words'**
  String get learnerHomeWordList;

  /// No description provided for @navHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get navHome;

  /// No description provided for @navLessons.
  ///
  /// In en, this message translates to:
  /// **'Lessons'**
  String get navLessons;

  /// No description provided for @navScanner.
  ///
  /// In en, this message translates to:
  /// **'Scanner'**
  String get navScanner;

  /// No description provided for @navGames.
  ///
  /// In en, this message translates to:
  /// **'Games'**
  String get navGames;

  /// No description provided for @navProfile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get navProfile;

  /// No description provided for @navTeacherHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get navTeacherHome;

  /// No description provided for @navTeacherLearners.
  ///
  /// In en, this message translates to:
  /// **'Learners'**
  String get navTeacherLearners;

  /// No description provided for @navTeacherReport.
  ///
  /// In en, this message translates to:
  /// **'Report'**
  String get navTeacherReport;

  /// No description provided for @navTeacherProfile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get navTeacherProfile;

  /// No description provided for @navCoordinatorHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get navCoordinatorHome;

  /// No description provided for @navCoordinatorAnalytics.
  ///
  /// In en, this message translates to:
  /// **'Analytics'**
  String get navCoordinatorAnalytics;

  /// No description provided for @navCoordinatorTeachers.
  ///
  /// In en, this message translates to:
  /// **'Teachers'**
  String get navCoordinatorTeachers;

  /// No description provided for @navCoordinatorProfile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get navCoordinatorProfile;

  /// No description provided for @teacherProfileTitle.
  ///
  /// In en, this message translates to:
  /// **'Teacher Profile'**
  String get teacherProfileTitle;

  /// No description provided for @teacherProfileName.
  ///
  /// In en, this message translates to:
  /// **'Gng. Santos'**
  String get teacherProfileName;

  /// No description provided for @teacherProfileRole.
  ///
  /// In en, this message translates to:
  /// **'Teacher'**
  String get teacherProfileRole;

  /// No description provided for @teacherProfileClassesLabel.
  ///
  /// In en, this message translates to:
  /// **'Classes Handled'**
  String get teacherProfileClassesLabel;

  /// No description provided for @teacherProfileClassesValue.
  ///
  /// In en, this message translates to:
  /// **'2'**
  String get teacherProfileClassesValue;

  /// No description provided for @teacherProfileLearnersLabel.
  ///
  /// In en, this message translates to:
  /// **'Total Learners'**
  String get teacherProfileLearnersLabel;

  /// No description provided for @teacherProfileLearnersValue.
  ///
  /// In en, this message translates to:
  /// **'58'**
  String get teacherProfileLearnersValue;

  /// No description provided for @coordinatorProfileTitle.
  ///
  /// In en, this message translates to:
  /// **'Coordinator Profile'**
  String get coordinatorProfileTitle;

  /// No description provided for @coordinatorProfileName.
  ///
  /// In en, this message translates to:
  /// **'Dr. Reyes'**
  String get coordinatorProfileName;

  /// No description provided for @coordinatorProfileRole.
  ///
  /// In en, this message translates to:
  /// **'Coordinator'**
  String get coordinatorProfileRole;

  /// No description provided for @coordinatorProfileSchoolsLabel.
  ///
  /// In en, this message translates to:
  /// **'Schools Supervised'**
  String get coordinatorProfileSchoolsLabel;

  /// No description provided for @coordinatorProfileSchoolsValue.
  ///
  /// In en, this message translates to:
  /// **'1'**
  String get coordinatorProfileSchoolsValue;

  /// No description provided for @coordinatorProfileTeachersLabel.
  ///
  /// In en, this message translates to:
  /// **'Teachers Supervised'**
  String get coordinatorProfileTeachersLabel;

  /// No description provided for @coordinatorProfileTeachersValue.
  ///
  /// In en, this message translates to:
  /// **'6'**
  String get coordinatorProfileTeachersValue;

  /// No description provided for @gamesHubTitle.
  ///
  /// In en, this message translates to:
  /// **'Games'**
  String get gamesHubTitle;

  /// No description provided for @gamesHubBiboMessage.
  ///
  /// In en, this message translates to:
  /// **'Pick a game and have fun learning!'**
  String get gamesHubBiboMessage;

  /// No description provided for @gamesHubQuizTitle.
  ///
  /// In en, this message translates to:
  /// **'Quiz Time'**
  String get gamesHubQuizTitle;

  /// No description provided for @gamesHubQuizDescription.
  ///
  /// In en, this message translates to:
  /// **'Test what you\'ve learned!'**
  String get gamesHubQuizDescription;

  /// No description provided for @gamesHubDictionaryTitle.
  ///
  /// In en, this message translates to:
  /// **'Picture Dictionary'**
  String get gamesHubDictionaryTitle;

  /// No description provided for @gamesHubDictionaryDescription.
  ///
  /// In en, this message translates to:
  /// **'Explore Filipino words with pictures!'**
  String get gamesHubDictionaryDescription;

  /// No description provided for @lessonListTitle.
  ///
  /// In en, this message translates to:
  /// **'Phonics Lessons'**
  String get lessonListTitle;

  /// No description provided for @lessonListBiboMessage.
  ///
  /// In en, this message translates to:
  /// **'Pick a lesson and let\'s practice together!'**
  String get lessonListBiboMessage;

  /// No description provided for @lessonDetailSpeakNow.
  ///
  /// In en, this message translates to:
  /// **'Speak Now'**
  String get lessonDetailSpeakNow;

  /// No description provided for @lessonDetailListenFirst.
  ///
  /// In en, this message translates to:
  /// **'Listen First'**
  String get lessonDetailListenFirst;

  /// No description provided for @lessonDetailTryAgain.
  ///
  /// In en, this message translates to:
  /// **'Try Again'**
  String get lessonDetailTryAgain;

  /// No description provided for @lessonDetailBiboEncourage.
  ///
  /// In en, this message translates to:
  /// **'You can do it! Say the sound out loud.'**
  String get lessonDetailBiboEncourage;

  /// No description provided for @lessonDetailMouthGuide.
  ///
  /// In en, this message translates to:
  /// **'Mouth Guide'**
  String get lessonDetailMouthGuide;

  /// No description provided for @lessonCompletionTitle.
  ///
  /// In en, this message translates to:
  /// **'Amazing Work!'**
  String get lessonCompletionTitle;

  /// No description provided for @lessonCompletionXpEarned.
  ///
  /// In en, this message translates to:
  /// **'+{xp} XP'**
  String lessonCompletionXpEarned(int xp);

  /// No description provided for @lessonCompletionContinue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get lessonCompletionContinue;

  /// No description provided for @lessonCompletionBiboMessage.
  ///
  /// In en, this message translates to:
  /// **'You\'re getting better every day!'**
  String get lessonCompletionBiboMessage;

  /// No description provided for @quizTitle.
  ///
  /// In en, this message translates to:
  /// **'Quiz Time!'**
  String get quizTitle;

  /// No description provided for @quizScoreLabel.
  ///
  /// In en, this message translates to:
  /// **'Score: {score}/{total}'**
  String quizScoreLabel(int score, int total);

  /// No description provided for @quizNextQuestion.
  ///
  /// In en, this message translates to:
  /// **'Next Question'**
  String get quizNextQuestion;

  /// No description provided for @quizFinish.
  ///
  /// In en, this message translates to:
  /// **'See Results'**
  String get quizFinish;

  /// No description provided for @quizCorrectBibo.
  ///
  /// In en, this message translates to:
  /// **'That\'s right! Great job!'**
  String get quizCorrectBibo;

  /// No description provided for @quizWrongBibo.
  ///
  /// In en, this message translates to:
  /// **'Almost! Let\'s try the next one.'**
  String get quizWrongBibo;

  /// No description provided for @quizCompleteBibo.
  ///
  /// In en, this message translates to:
  /// **'You finished the quiz! Well done!'**
  String get quizCompleteBibo;

  /// No description provided for @scannerTitle.
  ///
  /// In en, this message translates to:
  /// **'Scan QR Code'**
  String get scannerTitle;

  /// No description provided for @scannerInstruction.
  ///
  /// In en, this message translates to:
  /// **'Scan a Book QR Code'**
  String get scannerInstruction;

  /// No description provided for @scannerBiboMessage.
  ///
  /// In en, this message translates to:
  /// **'Point your camera at the QR code on the book!'**
  String get scannerBiboMessage;

  /// No description provided for @scannerSuccess.
  ///
  /// In en, this message translates to:
  /// **'Book unlocked! Let\'s read!'**
  String get scannerSuccess;

  /// No description provided for @scannerInvalid.
  ///
  /// In en, this message translates to:
  /// **'Hmm, try a different QR code!'**
  String get scannerInvalid;

  /// No description provided for @scannerBiboError.
  ///
  /// In en, this message translates to:
  /// **'That doesn\'t look right. Try scanning again!'**
  String get scannerBiboError;

  /// No description provided for @dictionaryTitle.
  ///
  /// In en, this message translates to:
  /// **'Picture Dictionary'**
  String get dictionaryTitle;

  /// No description provided for @dictionarySearchHint.
  ///
  /// In en, this message translates to:
  /// **'Search for a word...'**
  String get dictionarySearchHint;

  /// No description provided for @dictionaryOfflineLabel.
  ///
  /// In en, this message translates to:
  /// **'Available offline'**
  String get dictionaryOfflineLabel;

  /// No description provided for @dictionaryBiboMessage.
  ///
  /// In en, this message translates to:
  /// **'Tap a word to hear how it sounds!'**
  String get dictionaryBiboMessage;

  /// No description provided for @progressTitle.
  ///
  /// In en, this message translates to:
  /// **'My Progress'**
  String get progressTitle;

  /// No description provided for @progressLevel.
  ///
  /// In en, this message translates to:
  /// **'Level {level}'**
  String progressLevel(int level);

  /// No description provided for @progressNextLevel.
  ///
  /// In en, this message translates to:
  /// **'Next level at {xp} XP'**
  String progressNextLevel(int xp);

  /// No description provided for @progressCompletedLessons.
  ///
  /// In en, this message translates to:
  /// **'Completed Lessons'**
  String get progressCompletedLessons;

  /// No description provided for @progressStruggleWords.
  ///
  /// In en, this message translates to:
  /// **'Words to Practice'**
  String get progressStruggleWords;

  /// No description provided for @progressAchievements.
  ///
  /// In en, this message translates to:
  /// **'Achievements'**
  String get progressAchievements;

  /// No description provided for @progressBiboMessage.
  ///
  /// In en, this message translates to:
  /// **'Look how far you\'ve come!'**
  String get progressBiboMessage;

  /// No description provided for @teacherDashboardTitle.
  ///
  /// In en, this message translates to:
  /// **'Class Overview'**
  String get teacherDashboardTitle;

  /// No description provided for @teacherDashboardTotalLearners.
  ///
  /// In en, this message translates to:
  /// **'{count} Learners'**
  String teacherDashboardTotalLearners(int count);

  /// No description provided for @teacherDashboardOnTrack.
  ///
  /// In en, this message translates to:
  /// **'On Track'**
  String get teacherDashboardOnTrack;

  /// No description provided for @teacherDashboardNeedsHelp.
  ///
  /// In en, this message translates to:
  /// **'Needs Help'**
  String get teacherDashboardNeedsHelp;

  /// No description provided for @teacherDashboardNonReaders.
  ///
  /// In en, this message translates to:
  /// **'Non-readers'**
  String get teacherDashboardNonReaders;

  /// No description provided for @teacherDashboardRecentActivity.
  ///
  /// In en, this message translates to:
  /// **'Recent Activity'**
  String get teacherDashboardRecentActivity;

  /// No description provided for @teacherDashboardViewReport.
  ///
  /// In en, this message translates to:
  /// **'View Full Report'**
  String get teacherDashboardViewReport;

  /// No description provided for @teacherReportTitle.
  ///
  /// In en, this message translates to:
  /// **'Class Report'**
  String get teacherReportTitle;

  /// No description provided for @teacherReportName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get teacherReportName;

  /// No description provided for @teacherReportLessons.
  ///
  /// In en, this message translates to:
  /// **'Lessons'**
  String get teacherReportLessons;

  /// No description provided for @teacherReportAvgScore.
  ///
  /// In en, this message translates to:
  /// **'Avg Score'**
  String get teacherReportAvgScore;

  /// No description provided for @teacherReportStatus.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get teacherReportStatus;

  /// No description provided for @teacherReportStruggleWords.
  ///
  /// In en, this message translates to:
  /// **'Struggle Words'**
  String get teacherReportStruggleWords;

  /// No description provided for @teacherReportDownload.
  ///
  /// In en, this message translates to:
  /// **'Download Report'**
  String get teacherReportDownload;

  /// No description provided for @teacherReportDateRange.
  ///
  /// In en, this message translates to:
  /// **'Date Range'**
  String get teacherReportDateRange;

  /// No description provided for @teacherReportStatusOnTrack.
  ///
  /// In en, this message translates to:
  /// **'On Track'**
  String get teacherReportStatusOnTrack;

  /// No description provided for @teacherReportStatusNeedsHelp.
  ///
  /// In en, this message translates to:
  /// **'Needs Help'**
  String get teacherReportStatusNeedsHelp;

  /// No description provided for @teacherReportStatusNonReader.
  ///
  /// In en, this message translates to:
  /// **'Non-reader'**
  String get teacherReportStatusNonReader;

  /// No description provided for @offlineBannerMessage.
  ///
  /// In en, this message translates to:
  /// **'You are offline — progress is saved locally'**
  String get offlineBannerMessage;

  /// No description provided for @generalLoading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get generalLoading;

  /// No description provided for @generalError.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong. Let\'s try again!'**
  String get generalError;

  /// No description provided for @generalRetry.
  ///
  /// In en, this message translates to:
  /// **'Try Again'**
  String get generalRetry;

  /// No description provided for @roleSelectionTitle.
  ///
  /// In en, this message translates to:
  /// **'BASA AI'**
  String get roleSelectionTitle;

  /// No description provided for @roleSelectionSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Choose your role to get started'**
  String get roleSelectionSubtitle;

  /// No description provided for @roleSelectionLearner.
  ///
  /// In en, this message translates to:
  /// **'Learner'**
  String get roleSelectionLearner;

  /// No description provided for @roleSelectionTeacher.
  ///
  /// In en, this message translates to:
  /// **'Teacher'**
  String get roleSelectionTeacher;

  /// No description provided for @roleSelectionCoordinator.
  ///
  /// In en, this message translates to:
  /// **'Coordinator'**
  String get roleSelectionCoordinator;

  /// No description provided for @helpGuideTitle.
  ///
  /// In en, this message translates to:
  /// **'Help & Guide'**
  String get helpGuideTitle;

  /// No description provided for @helpGuideSoundDetection.
  ///
  /// In en, this message translates to:
  /// **'Sound Detection'**
  String get helpGuideSoundDetection;

  /// No description provided for @helpGuideSoundDetectionDesc.
  ///
  /// In en, this message translates to:
  /// **'Learn how the app listens to your pronunciation.'**
  String get helpGuideSoundDetectionDesc;

  /// No description provided for @helpGuideStorytelling.
  ///
  /// In en, this message translates to:
  /// **'Storytelling'**
  String get helpGuideStorytelling;

  /// No description provided for @helpGuideStorytellingDesc.
  ///
  /// In en, this message translates to:
  /// **'Discover fun stories to practice reading.'**
  String get helpGuideStorytellingDesc;

  /// No description provided for @helpGuideQrStories.
  ///
  /// In en, this message translates to:
  /// **'QR Stories'**
  String get helpGuideQrStories;

  /// No description provided for @helpGuideQrStoriesDesc.
  ///
  /// In en, this message translates to:
  /// **'Scan QR codes to unlock exciting storybooks.'**
  String get helpGuideQrStoriesDesc;

  /// No description provided for @helpGuideMouthDetection.
  ///
  /// In en, this message translates to:
  /// **'Mouth Detection'**
  String get helpGuideMouthDetection;

  /// No description provided for @helpGuideMouthDetectionDesc.
  ///
  /// In en, this message translates to:
  /// **'See how to shape your mouth for each sound.'**
  String get helpGuideMouthDetectionDesc;

  /// No description provided for @helpGuidePictureDictionary.
  ///
  /// In en, this message translates to:
  /// **'Picture Dictionary'**
  String get helpGuidePictureDictionary;

  /// No description provided for @helpGuidePictureDictionaryDesc.
  ///
  /// In en, this message translates to:
  /// **'Explore words with colorful pictures.'**
  String get helpGuidePictureDictionaryDesc;

  /// No description provided for @helpGuideGeneralTips.
  ///
  /// In en, this message translates to:
  /// **'General Tips'**
  String get helpGuideGeneralTips;

  /// No description provided for @helpGuideGeneralTipsDesc.
  ///
  /// In en, this message translates to:
  /// **'Helpful tips for parents and teachers.'**
  String get helpGuideGeneralTipsDesc;

  /// No description provided for @helpGuideClose.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get helpGuideClose;

  /// No description provided for @leaderboardTitle.
  ///
  /// In en, this message translates to:
  /// **'Leaderboard'**
  String get leaderboardTitle;

  /// No description provided for @leaderboardBiboMessage.
  ///
  /// In en, this message translates to:
  /// **'See who\'s reading the most!'**
  String get leaderboardBiboMessage;

  /// No description provided for @leaderboardClassFilter.
  ///
  /// In en, this message translates to:
  /// **'All Classes'**
  String get leaderboardClassFilter;

  /// No description provided for @leaderboardXp.
  ///
  /// In en, this message translates to:
  /// **'{xp} XP'**
  String leaderboardXp(int xp);

  /// No description provided for @leaderboardRank.
  ///
  /// In en, this message translates to:
  /// **'#{rank}'**
  String leaderboardRank(int rank);

  /// No description provided for @appSettingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get appSettingsTitle;

  /// No description provided for @appSettingsVolume.
  ///
  /// In en, this message translates to:
  /// **'Volume'**
  String get appSettingsVolume;

  /// No description provided for @appSettingsLanguage.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get appSettingsLanguage;

  /// No description provided for @appSettingsLanguageEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get appSettingsLanguageEnglish;

  /// No description provided for @appSettingsLanguageFilipino.
  ///
  /// In en, this message translates to:
  /// **'Filipino'**
  String get appSettingsLanguageFilipino;

  /// No description provided for @appSettingsBackgroundMusic.
  ///
  /// In en, this message translates to:
  /// **'Background Music'**
  String get appSettingsBackgroundMusic;

  /// No description provided for @appSettingsHighContrast.
  ///
  /// In en, this message translates to:
  /// **'High Contrast Mode'**
  String get appSettingsHighContrast;

  /// No description provided for @coordinatorLoginTitle.
  ///
  /// In en, this message translates to:
  /// **'Coordinator Login'**
  String get coordinatorLoginTitle;

  /// No description provided for @coordinatorLoginBiboMessage.
  ///
  /// In en, this message translates to:
  /// **'Welcome, Coordinator! Sign in to view program analytics.'**
  String get coordinatorLoginBiboMessage;

  /// No description provided for @coordinatorLoginEmailLabel.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get coordinatorLoginEmailLabel;

  /// No description provided for @coordinatorLoginEmailHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get coordinatorLoginEmailHint;

  /// No description provided for @coordinatorLoginPasswordLabel.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get coordinatorLoginPasswordLabel;

  /// No description provided for @coordinatorLoginPasswordHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get coordinatorLoginPasswordHint;

  /// No description provided for @coordinatorLoginButton.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get coordinatorLoginButton;

  /// No description provided for @learnerSettingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get learnerSettingsTitle;

  /// No description provided for @learnerSettingsVolume.
  ///
  /// In en, this message translates to:
  /// **'Sound Volume'**
  String get learnerSettingsVolume;

  /// No description provided for @learnerSettingsLanguage.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get learnerSettingsLanguage;

  /// No description provided for @learnerSettingsMusic.
  ///
  /// In en, this message translates to:
  /// **'Background Music'**
  String get learnerSettingsMusic;

  /// No description provided for @learnerSettingsHighContrast.
  ///
  /// In en, this message translates to:
  /// **'High Contrast Mode'**
  String get learnerSettingsHighContrast;

  /// No description provided for @learnerSettingsBackToHome.
  ///
  /// In en, this message translates to:
  /// **'Back to Home'**
  String get learnerSettingsBackToHome;

  /// No description provided for @manageUsersTitle.
  ///
  /// In en, this message translates to:
  /// **'Manage Learners'**
  String get manageUsersTitle;

  /// No description provided for @manageUsersAddLearner.
  ///
  /// In en, this message translates to:
  /// **'Add Learner'**
  String get manageUsersAddLearner;

  /// No description provided for @manageUsersEmpty.
  ///
  /// In en, this message translates to:
  /// **'No learners yet. Tap + to add your first learner.'**
  String get manageUsersEmpty;

  /// No description provided for @manageUsersLrnLabel.
  ///
  /// In en, this message translates to:
  /// **'Learner Reference Number (LRN)'**
  String get manageUsersLrnLabel;

  /// No description provided for @manageUsersNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get manageUsersNameLabel;

  /// No description provided for @manageUsersGradeLabel.
  ///
  /// In en, this message translates to:
  /// **'Grade'**
  String get manageUsersGradeLabel;

  /// No description provided for @manageUsersSectionLabel.
  ///
  /// In en, this message translates to:
  /// **'Section'**
  String get manageUsersSectionLabel;

  /// No description provided for @manageUsersSave.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get manageUsersSave;

  /// No description provided for @manageUsersCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get manageUsersCancel;

  /// No description provided for @manageUsersRemoveConfirm.
  ///
  /// In en, this message translates to:
  /// **'Remove {name} from your class?'**
  String manageUsersRemoveConfirm(String name);

  /// No description provided for @manageUsersRemove.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get manageUsersRemove;

  /// No description provided for @trackProgressTitle.
  ///
  /// In en, this message translates to:
  /// **'Learner Progress'**
  String get trackProgressTitle;

  /// No description provided for @trackProgressLessonsCompleted.
  ///
  /// In en, this message translates to:
  /// **'Lessons Completed'**
  String get trackProgressLessonsCompleted;

  /// No description provided for @trackProgressAvgScore.
  ///
  /// In en, this message translates to:
  /// **'Average Score'**
  String get trackProgressAvgScore;

  /// No description provided for @trackProgressActivityLog.
  ///
  /// In en, this message translates to:
  /// **'Activity Log'**
  String get trackProgressActivityLog;

  /// No description provided for @trackProgressViewWords.
  ///
  /// In en, this message translates to:
  /// **'View Difficult Words'**
  String get trackProgressViewWords;

  /// No description provided for @trackProgressAddFeedback.
  ///
  /// In en, this message translates to:
  /// **'Add Feedback Note'**
  String get trackProgressAddFeedback;

  /// No description provided for @trackProgressDate.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get trackProgressDate;

  /// No description provided for @trackProgressLesson.
  ///
  /// In en, this message translates to:
  /// **'Lesson'**
  String get trackProgressLesson;

  /// No description provided for @trackProgressScore.
  ///
  /// In en, this message translates to:
  /// **'Score'**
  String get trackProgressScore;

  /// No description provided for @trackProgressDuration.
  ///
  /// In en, this message translates to:
  /// **'Duration'**
  String get trackProgressDuration;

  /// No description provided for @trackProgressOf.
  ///
  /// In en, this message translates to:
  /// **'{done} / {total} lessons'**
  String trackProgressOf(int done, int total);

  /// No description provided for @wordsScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Word Tracking'**
  String get wordsScreenTitle;

  /// No description provided for @wordsScreenStrugglingTab.
  ///
  /// In en, this message translates to:
  /// **'Struggling'**
  String get wordsScreenStrugglingTab;

  /// No description provided for @wordsScreenMasteredTab.
  ///
  /// In en, this message translates to:
  /// **'Mastered'**
  String get wordsScreenMasteredTab;

  /// No description provided for @wordsScreenNoStruggling.
  ///
  /// In en, this message translates to:
  /// **'No struggling words — great job!'**
  String get wordsScreenNoStruggling;

  /// No description provided for @wordsScreenNoMastered.
  ///
  /// In en, this message translates to:
  /// **'No mastered words yet'**
  String get wordsScreenNoMastered;

  /// No description provided for @wordsScreenFailCount.
  ///
  /// In en, this message translates to:
  /// **'{count} fails'**
  String wordsScreenFailCount(int count);

  /// No description provided for @feedbackTitle.
  ///
  /// In en, this message translates to:
  /// **'Teacher Feedback'**
  String get feedbackTitle;

  /// No description provided for @feedbackAddNote.
  ///
  /// In en, this message translates to:
  /// **'Add Note'**
  String get feedbackAddNote;

  /// No description provided for @feedbackSave.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get feedbackSave;

  /// No description provided for @feedbackHint.
  ///
  /// In en, this message translates to:
  /// **'Write a note about this learner...'**
  String get feedbackHint;

  /// No description provided for @feedbackCharLimit.
  ///
  /// In en, this message translates to:
  /// **'{count}/300'**
  String feedbackCharLimit(int count);

  /// No description provided for @feedbackEmpty.
  ///
  /// In en, this message translates to:
  /// **'No feedback notes yet.'**
  String get feedbackEmpty;

  /// No description provided for @coordinatorDashboardTitle.
  ///
  /// In en, this message translates to:
  /// **'Program Overview'**
  String get coordinatorDashboardTitle;

  /// No description provided for @coordinatorTotalLearners.
  ///
  /// In en, this message translates to:
  /// **'Total Learners'**
  String get coordinatorTotalLearners;

  /// No description provided for @coordinatorTotalTeachers.
  ///
  /// In en, this message translates to:
  /// **'Total Teachers'**
  String get coordinatorTotalTeachers;

  /// No description provided for @coordinatorTotalClasses.
  ///
  /// In en, this message translates to:
  /// **'Classes'**
  String get coordinatorTotalClasses;

  /// No description provided for @coordinatorAvgScore.
  ///
  /// In en, this message translates to:
  /// **'Avg Score'**
  String get coordinatorAvgScore;

  /// No description provided for @coordinatorTeacherList.
  ///
  /// In en, this message translates to:
  /// **'Teachers'**
  String get coordinatorTeacherList;

  /// No description provided for @coordinatorViewAnalytics.
  ///
  /// In en, this message translates to:
  /// **'View All Analytics'**
  String get coordinatorViewAnalytics;

  /// No description provided for @coordinatorProgramHealth.
  ///
  /// In en, this message translates to:
  /// **'Program Health'**
  String get coordinatorProgramHealth;

  /// No description provided for @coordinatorOnTrackPercent.
  ///
  /// In en, this message translates to:
  /// **'{percent}% On Track'**
  String coordinatorOnTrackPercent(int percent);

  /// No description provided for @analyticsTitle.
  ///
  /// In en, this message translates to:
  /// **'Program Analytics'**
  String get analyticsTitle;

  /// No description provided for @analyticsReadingLevels.
  ///
  /// In en, this message translates to:
  /// **'Reading Level Distribution'**
  String get analyticsReadingLevels;

  /// No description provided for @analyticsNonReader.
  ///
  /// In en, this message translates to:
  /// **'Non-reader'**
  String get analyticsNonReader;

  /// No description provided for @analyticsFrustration.
  ///
  /// In en, this message translates to:
  /// **'Frustration'**
  String get analyticsFrustration;

  /// No description provided for @analyticsInstructional.
  ///
  /// In en, this message translates to:
  /// **'Instructional'**
  String get analyticsInstructional;

  /// No description provided for @analyticsIndependent.
  ///
  /// In en, this message translates to:
  /// **'Independent'**
  String get analyticsIndependent;

  /// No description provided for @analyticsTrendTitle.
  ///
  /// In en, this message translates to:
  /// **'Score Trend'**
  String get analyticsTrendTitle;

  /// No description provided for @analyticsTopStruggle.
  ///
  /// In en, this message translates to:
  /// **'Top Struggling Words'**
  String get analyticsTopStruggle;

  /// No description provided for @analyticsSectionComparison.
  ///
  /// In en, this message translates to:
  /// **'Section Comparison'**
  String get analyticsSectionComparison;

  /// No description provided for @analyticsClass.
  ///
  /// In en, this message translates to:
  /// **'Class'**
  String get analyticsClass;

  /// No description provided for @analyticsAvgScore.
  ///
  /// In en, this message translates to:
  /// **'Avg Score'**
  String get analyticsAvgScore;

  /// No description provided for @analyticsOnTrack.
  ///
  /// In en, this message translates to:
  /// **'% On Track'**
  String get analyticsOnTrack;

  /// No description provided for @superviseTitle.
  ///
  /// In en, this message translates to:
  /// **'Supervise Teachers'**
  String get superviseTitle;

  /// No description provided for @superviseEmpty.
  ///
  /// In en, this message translates to:
  /// **'No teachers registered yet'**
  String get superviseEmpty;

  /// No description provided for @superviseTeacherClasses.
  ///
  /// In en, this message translates to:
  /// **'{count} classes'**
  String superviseTeacherClasses(int count);

  /// No description provided for @superviseTeacherLearners.
  ///
  /// In en, this message translates to:
  /// **'{count} learners'**
  String superviseTeacherLearners(int count);

  /// No description provided for @superviseLastLogin.
  ///
  /// In en, this message translates to:
  /// **'Last login: {date}'**
  String superviseLastLogin(String date);

  /// No description provided for @coordinatorReportTitle.
  ///
  /// In en, this message translates to:
  /// **'Coordinator Report'**
  String get coordinatorReportTitle;

  /// No description provided for @coordinatorReportSchoolWide.
  ///
  /// In en, this message translates to:
  /// **'School-Wide Report'**
  String get coordinatorReportSchoolWide;

  /// No description provided for @coordinatorReportSectionBreakdown.
  ///
  /// In en, this message translates to:
  /// **'Section Breakdown'**
  String get coordinatorReportSectionBreakdown;

  /// No description provided for @coordinatorReportPhilIri.
  ///
  /// In en, this message translates to:
  /// **'Phil-IRI Comparison'**
  String get coordinatorReportPhilIri;

  /// No description provided for @coordinatorReportPreTest.
  ///
  /// In en, this message translates to:
  /// **'Pre-Test'**
  String get coordinatorReportPreTest;

  /// No description provided for @coordinatorReportPostTest.
  ///
  /// In en, this message translates to:
  /// **'Post-Test'**
  String get coordinatorReportPostTest;

  /// No description provided for @coordinatorReportDelta.
  ///
  /// In en, this message translates to:
  /// **'Delta'**
  String get coordinatorReportDelta;

  /// No description provided for @coordinatorReportExportPdf.
  ///
  /// In en, this message translates to:
  /// **'Export Full Report'**
  String get coordinatorReportExportPdf;

  /// No description provided for @coordinatorReportExportCsv.
  ///
  /// In en, this message translates to:
  /// **'Export CSV'**
  String get coordinatorReportExportCsv;

  /// No description provided for @teacherManageLearners.
  ///
  /// In en, this message translates to:
  /// **'Manage Learners'**
  String get teacherManageLearners;

  /// No description provided for @teacherViewProgress.
  ///
  /// In en, this message translates to:
  /// **'View Progress'**
  String get teacherViewProgress;

  /// No description provided for @teacherGenerateReport.
  ///
  /// In en, this message translates to:
  /// **'Generate Report'**
  String get teacherGenerateReport;

  /// No description provided for @assignTeacherTitle.
  ///
  /// In en, this message translates to:
  /// **'Assign Teacher to Class'**
  String get assignTeacherTitle;

  /// No description provided for @assignTeacherUnassigned.
  ///
  /// In en, this message translates to:
  /// **'Unassigned'**
  String get assignTeacherUnassigned;

  /// No description provided for @assignTeacherButton.
  ///
  /// In en, this message translates to:
  /// **'Assign Teacher'**
  String get assignTeacherButton;

  /// No description provided for @assignTeacherReassign.
  ///
  /// In en, this message translates to:
  /// **'Reassign'**
  String get assignTeacherReassign;

  /// No description provided for @assignTeacherCreateClass.
  ///
  /// In en, this message translates to:
  /// **'Create New Class'**
  String get assignTeacherCreateClass;

  /// No description provided for @assignTeacherGradeLabel.
  ///
  /// In en, this message translates to:
  /// **'Grade Level'**
  String get assignTeacherGradeLabel;

  /// No description provided for @assignTeacherSectionLabel.
  ///
  /// In en, this message translates to:
  /// **'Section Name'**
  String get assignTeacherSectionLabel;

  /// No description provided for @assignTeacherSelectTeacher.
  ///
  /// In en, this message translates to:
  /// **'Select Teacher'**
  String get assignTeacherSelectTeacher;

  /// No description provided for @assignTeacherConfirm.
  ///
  /// In en, this message translates to:
  /// **'Assign'**
  String get assignTeacherConfirm;

  /// No description provided for @assignTeacherEmpty.
  ///
  /// In en, this message translates to:
  /// **'No classes yet. Tap + to create your first class.'**
  String get assignTeacherEmpty;

  /// No description provided for @assignTeacherSuccess.
  ///
  /// In en, this message translates to:
  /// **'Teacher assigned successfully!'**
  String get assignTeacherSuccess;

  /// No description provided for @assignTeacherCreateSuccess.
  ///
  /// In en, this message translates to:
  /// **'Class created successfully!'**
  String get assignTeacherCreateSuccess;
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
      <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
