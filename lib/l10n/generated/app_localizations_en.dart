// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'BASA AI';

  @override
  String get loginTitle => 'Welcome to BASA AI!';

  @override
  String get loginLearnerTab => 'Learner';

  @override
  String get loginTeacherTab => 'Teacher';

  @override
  String get loginLrnHint => 'Enter your Learner Reference Number';

  @override
  String get loginLrnLabel => 'Learner Reference Number (LRN)';

  @override
  String get loginEnterButton => 'Let\'s Go!';

  @override
  String get loginTeacherEmailHint => 'Enter your email';

  @override
  String get loginTeacherEmailLabel => 'Email';

  @override
  String get loginTeacherPasswordHint => 'Enter your password';

  @override
  String get loginTeacherPasswordLabel => 'Password';

  @override
  String get loginTeacherButton => 'Sign In';

  @override
  String get loginBiboWelcome =>
      'Hi there! I\'m Bibo. Let\'s learn to read together!';

  @override
  String get loginBiboTeacher =>
      'Welcome back, Teacher! Sign in to see your class.';

  @override
  String get logoutTitle => 'See You Soon!';

  @override
  String get logoutConfirmation => 'Are you sure you want to log out?';

  @override
  String get logoutButton => 'Log Out';

  @override
  String get logoutCancel => 'Stay';

  @override
  String get logoutBiboMessage =>
      'Come back soon! We\'ll keep your progress safe.';

  @override
  String learnerHomeGreeting(String name) {
    return 'Hi, $name!';
  }

  @override
  String get learnerHomeTodayLesson => 'Today\'s Lesson';

  @override
  String get learnerHomeStartNow => 'Start Now';

  @override
  String get learnerHomeGames => 'Games';

  @override
  String get learnerHomeWordList => 'Words';

  @override
  String get navHome => 'Home';

  @override
  String get navLessons => 'Lessons';

  @override
  String get navScanner => 'Scanner';

  @override
  String get navGames => 'Games';

  @override
  String get navProfile => 'Profile';

  @override
  String get navTeacherHome => 'Home';

  @override
  String get navTeacherLearners => 'Learners';

  @override
  String get navTeacherReport => 'Report';

  @override
  String get navTeacherProfile => 'Profile';

  @override
  String get navCoordinatorHome => 'Home';

  @override
  String get navCoordinatorAnalytics => 'Analytics';

  @override
  String get navCoordinatorTeachers => 'Teachers';

  @override
  String get navCoordinatorProfile => 'Profile';

  @override
  String get teacherProfileTitle => 'Teacher Profile';

  @override
  String get teacherProfileName => 'Gng. Santos';

  @override
  String get teacherProfileRole => 'Teacher';

  @override
  String get teacherProfileClassesLabel => 'Classes Handled';

  @override
  String get teacherProfileClassesValue => '2';

  @override
  String get teacherProfileLearnersLabel => 'Total Learners';

  @override
  String get teacherProfileLearnersValue => '58';

  @override
  String get coordinatorProfileTitle => 'Coordinator Profile';

  @override
  String get coordinatorProfileName => 'Dr. Reyes';

  @override
  String get coordinatorProfileRole => 'Coordinator';

  @override
  String get coordinatorProfileSchoolsLabel => 'Schools Supervised';

  @override
  String get coordinatorProfileSchoolsValue => '1';

  @override
  String get coordinatorProfileTeachersLabel => 'Teachers Supervised';

  @override
  String get coordinatorProfileTeachersValue => '6';

  @override
  String get gamesHubTitle => 'Games';

  @override
  String get gamesHubBiboMessage => 'Pick a game and have fun learning!';

  @override
  String get gamesHubQuizTitle => 'Quiz Time';

  @override
  String get gamesHubQuizDescription => 'Test what you\'ve learned!';

  @override
  String get gamesHubDictionaryTitle => 'Picture Dictionary';

  @override
  String get gamesHubDictionaryDescription =>
      'Explore Filipino words with pictures!';

  @override
  String get lessonListTitle => 'Phonics Lessons';

  @override
  String get lessonListBiboMessage =>
      'Pick a lesson and let\'s practice together!';

  @override
  String get lessonDetailSpeakNow => 'Speak Now';

  @override
  String get lessonDetailListenFirst => 'Listen First';

  @override
  String get lessonDetailTryAgain => 'Try Again';

  @override
  String get lessonDetailBiboEncourage =>
      'You can do it! Say the sound out loud.';

  @override
  String get lessonDetailMouthGuide => 'Mouth Guide';

  @override
  String get lessonCompletionTitle => 'Amazing Work!';

  @override
  String lessonCompletionXpEarned(int xp) {
    return '+$xp XP';
  }

  @override
  String get lessonCompletionContinue => 'Continue';

  @override
  String get lessonCompletionBiboMessage => 'You\'re getting better every day!';

  @override
  String get quizTitle => 'Quiz Time!';

  @override
  String quizScoreLabel(int score, int total) {
    return 'Score: $score/$total';
  }

  @override
  String get quizNextQuestion => 'Next Question';

  @override
  String get quizFinish => 'See Results';

  @override
  String get quizCorrectBibo => 'That\'s right! Great job!';

  @override
  String get quizWrongBibo => 'Almost! Let\'s try the next one.';

  @override
  String get quizCompleteBibo => 'You finished the quiz! Well done!';

  @override
  String get scannerTitle => 'Scan QR Code';

  @override
  String get scannerInstruction => 'Scan a Book QR Code';

  @override
  String get scannerBiboMessage =>
      'Point your camera at the QR code on the book!';

  @override
  String get scannerSuccess => 'Book unlocked! Let\'s read!';

  @override
  String get scannerInvalid => 'Hmm, try a different QR code!';

  @override
  String get scannerBiboError =>
      'That doesn\'t look right. Try scanning again!';

  @override
  String get dictionaryTitle => 'Picture Dictionary';

  @override
  String get dictionarySearchHint => 'Search for a word...';

  @override
  String get dictionaryOfflineLabel => 'Available offline';

  @override
  String get dictionaryBiboMessage => 'Tap a word to hear how it sounds!';

  @override
  String get progressTitle => 'My Progress';

  @override
  String progressLevel(int level) {
    return 'Level $level';
  }

  @override
  String progressNextLevel(int xp) {
    return 'Next level at $xp XP';
  }

  @override
  String get progressCompletedLessons => 'Completed Lessons';

  @override
  String get progressStruggleWords => 'Words to Practice';

  @override
  String get progressAchievements => 'Achievements';

  @override
  String get progressBiboMessage => 'Look how far you\'ve come!';

  @override
  String get teacherDashboardTitle => 'Class Overview';

  @override
  String teacherDashboardTotalLearners(int count) {
    return '$count Learners';
  }

  @override
  String get teacherDashboardOnTrack => 'On Track';

  @override
  String get teacherDashboardNeedsHelp => 'Needs Help';

  @override
  String get teacherDashboardNonReaders => 'Non-readers';

  @override
  String get teacherDashboardRecentActivity => 'Recent Activity';

  @override
  String get teacherDashboardViewReport => 'View Full Report';

  @override
  String get teacherReportTitle => 'Class Report';

  @override
  String get teacherReportName => 'Name';

  @override
  String get teacherReportLessons => 'Lessons';

  @override
  String get teacherReportAvgScore => 'Avg Score';

  @override
  String get teacherReportStatus => 'Status';

  @override
  String get teacherReportStruggleWords => 'Struggle Words';

  @override
  String get teacherReportDownload => 'Download Report';

  @override
  String get teacherReportDateRange => 'Date Range';

  @override
  String get teacherReportStatusOnTrack => 'On Track';

  @override
  String get teacherReportStatusNeedsHelp => 'Needs Help';

  @override
  String get teacherReportStatusNonReader => 'Non-reader';

  @override
  String get offlineBannerMessage =>
      'You are offline — progress is saved locally';

  @override
  String get generalLoading => 'Loading...';

  @override
  String get generalError => 'Something went wrong. Let\'s try again!';

  @override
  String get generalRetry => 'Try Again';

  @override
  String get roleSelectionTitle => 'BASA AI';

  @override
  String get roleSelectionSubtitle => 'Choose your role to get started';

  @override
  String get roleSelectionLearner => 'Learner';

  @override
  String get roleSelectionTeacher => 'Teacher';

  @override
  String get roleSelectionCoordinator => 'Coordinator';

  @override
  String get helpGuideTitle => 'Help & Guide';

  @override
  String get helpGuideSoundDetection => 'Sound Detection';

  @override
  String get helpGuideSoundDetectionDesc =>
      'Learn how the app listens to your pronunciation.';

  @override
  String get helpGuideStorytelling => 'Storytelling';

  @override
  String get helpGuideStorytellingDesc =>
      'Discover fun stories to practice reading.';

  @override
  String get helpGuideQrStories => 'QR Stories';

  @override
  String get helpGuideQrStoriesDesc =>
      'Scan QR codes to unlock exciting storybooks.';

  @override
  String get helpGuideMouthDetection => 'Mouth Detection';

  @override
  String get helpGuideMouthDetectionDesc =>
      'See how to shape your mouth for each sound.';

  @override
  String get helpGuidePictureDictionary => 'Picture Dictionary';

  @override
  String get helpGuidePictureDictionaryDesc =>
      'Explore words with colorful pictures.';

  @override
  String get helpGuideGeneralTips => 'General Tips';

  @override
  String get helpGuideGeneralTipsDesc =>
      'Helpful tips for parents and teachers.';

  @override
  String get helpGuideClose => 'Close';

  @override
  String get leaderboardTitle => 'Leaderboard';

  @override
  String get leaderboardBiboMessage => 'See who\'s reading the most!';

  @override
  String get leaderboardClassFilter => 'All Classes';

  @override
  String leaderboardXp(int xp) {
    return '$xp XP';
  }

  @override
  String leaderboardRank(int rank) {
    return '#$rank';
  }

  @override
  String get appSettingsTitle => 'Settings';

  @override
  String get appSettingsVolume => 'Volume';

  @override
  String get appSettingsLanguage => 'Language';

  @override
  String get appSettingsLanguageEnglish => 'English';

  @override
  String get appSettingsLanguageFilipino => 'Filipino';

  @override
  String get appSettingsBackgroundMusic => 'Background Music';

  @override
  String get appSettingsHighContrast => 'High Contrast Mode';

  @override
  String get coordinatorLoginTitle => 'Coordinator Login';

  @override
  String get coordinatorLoginBiboMessage =>
      'Welcome, Coordinator! Sign in to view program analytics.';

  @override
  String get coordinatorLoginEmailLabel => 'Email';

  @override
  String get coordinatorLoginEmailHint => 'Enter your email';

  @override
  String get coordinatorLoginPasswordLabel => 'Password';

  @override
  String get coordinatorLoginPasswordHint => 'Enter your password';

  @override
  String get coordinatorLoginButton => 'Sign In';

  @override
  String get learnerSettingsTitle => 'Settings';

  @override
  String get learnerSettingsVolume => 'Sound Volume';

  @override
  String get learnerSettingsLanguage => 'Language';

  @override
  String get learnerSettingsMusic => 'Background Music';

  @override
  String get learnerSettingsHighContrast => 'High Contrast Mode';

  @override
  String get learnerSettingsBackToHome => 'Back to Home';

  @override
  String get manageUsersTitle => 'Manage Learners';

  @override
  String get manageUsersAddLearner => 'Add Learner';

  @override
  String get manageUsersEmpty =>
      'No learners yet. Tap + to add your first learner.';

  @override
  String get manageUsersLrnLabel => 'Learner Reference Number (LRN)';

  @override
  String get manageUsersNameLabel => 'Full Name';

  @override
  String get manageUsersGradeLabel => 'Grade';

  @override
  String get manageUsersSectionLabel => 'Section';

  @override
  String get manageUsersSave => 'Save';

  @override
  String get manageUsersCancel => 'Cancel';

  @override
  String manageUsersRemoveConfirm(String name) {
    return 'Remove $name from your class?';
  }

  @override
  String get manageUsersRemove => 'Remove';

  @override
  String get trackProgressTitle => 'Learner Progress';

  @override
  String get trackProgressLessonsCompleted => 'Lessons Completed';

  @override
  String get trackProgressAvgScore => 'Average Score';

  @override
  String get trackProgressActivityLog => 'Activity Log';

  @override
  String get trackProgressViewWords => 'View Difficult Words';

  @override
  String get trackProgressAddFeedback => 'Add Feedback Note';

  @override
  String get trackProgressDate => 'Date';

  @override
  String get trackProgressLesson => 'Lesson';

  @override
  String get trackProgressScore => 'Score';

  @override
  String get trackProgressDuration => 'Duration';

  @override
  String trackProgressOf(int done, int total) {
    return '$done / $total lessons';
  }

  @override
  String get wordsScreenTitle => 'Word Tracking';

  @override
  String get wordsScreenStrugglingTab => 'Struggling';

  @override
  String get wordsScreenMasteredTab => 'Mastered';

  @override
  String get wordsScreenNoStruggling => 'No struggling words — great job!';

  @override
  String get wordsScreenNoMastered => 'No mastered words yet';

  @override
  String wordsScreenFailCount(int count) {
    return '$count fails';
  }

  @override
  String get feedbackTitle => 'Teacher Feedback';

  @override
  String get feedbackAddNote => 'Add Note';

  @override
  String get feedbackSave => 'Save';

  @override
  String get feedbackHint => 'Write a note about this learner...';

  @override
  String feedbackCharLimit(int count) {
    return '$count/300';
  }

  @override
  String get feedbackEmpty => 'No feedback notes yet.';

  @override
  String get coordinatorDashboardTitle => 'Program Overview';

  @override
  String get coordinatorTotalLearners => 'Total Learners';

  @override
  String get coordinatorTotalTeachers => 'Total Teachers';

  @override
  String get coordinatorTotalClasses => 'Classes';

  @override
  String get coordinatorAvgScore => 'Avg Score';

  @override
  String get coordinatorTeacherList => 'Teachers';

  @override
  String get coordinatorViewAnalytics => 'View All Analytics';

  @override
  String get coordinatorProgramHealth => 'Program Health';

  @override
  String coordinatorOnTrackPercent(int percent) {
    return '$percent% On Track';
  }

  @override
  String get analyticsTitle => 'Program Analytics';

  @override
  String get analyticsReadingLevels => 'Reading Level Distribution';

  @override
  String get analyticsNonReader => 'Non-reader';

  @override
  String get analyticsFrustration => 'Frustration';

  @override
  String get analyticsInstructional => 'Instructional';

  @override
  String get analyticsIndependent => 'Independent';

  @override
  String get analyticsTrendTitle => 'Score Trend';

  @override
  String get analyticsTopStruggle => 'Top Struggling Words';

  @override
  String get analyticsSectionComparison => 'Section Comparison';

  @override
  String get analyticsClass => 'Class';

  @override
  String get analyticsAvgScore => 'Avg Score';

  @override
  String get analyticsOnTrack => '% On Track';

  @override
  String get superviseTitle => 'Supervise Teachers';

  @override
  String get superviseEmpty => 'No teachers registered yet';

  @override
  String superviseTeacherClasses(int count) {
    return '$count classes';
  }

  @override
  String superviseTeacherLearners(int count) {
    return '$count learners';
  }

  @override
  String superviseLastLogin(String date) {
    return 'Last login: $date';
  }

  @override
  String get coordinatorReportTitle => 'Coordinator Report';

  @override
  String get coordinatorReportSchoolWide => 'School-Wide Report';

  @override
  String get coordinatorReportSectionBreakdown => 'Section Breakdown';

  @override
  String get coordinatorReportPhilIri => 'Phil-IRI Comparison';

  @override
  String get coordinatorReportPreTest => 'Pre-Test';

  @override
  String get coordinatorReportPostTest => 'Post-Test';

  @override
  String get coordinatorReportDelta => 'Delta';

  @override
  String get coordinatorReportExportPdf => 'Export Full Report';

  @override
  String get coordinatorReportExportCsv => 'Export CSV';

  @override
  String get teacherManageLearners => 'Manage Learners';

  @override
  String get teacherViewProgress => 'View Progress';

  @override
  String get teacherGenerateReport => 'Generate Report';

  @override
  String get assignTeacherTitle => 'Assign Teacher to Class';

  @override
  String get assignTeacherUnassigned => 'Unassigned';

  @override
  String get assignTeacherButton => 'Assign Teacher';

  @override
  String get assignTeacherReassign => 'Reassign';

  @override
  String get assignTeacherCreateClass => 'Create New Class';

  @override
  String get assignTeacherGradeLabel => 'Grade Level';

  @override
  String get assignTeacherSectionLabel => 'Section Name';

  @override
  String get assignTeacherSelectTeacher => 'Select Teacher';

  @override
  String get assignTeacherConfirm => 'Assign';

  @override
  String get assignTeacherEmpty =>
      'No classes yet. Tap + to create your first class.';

  @override
  String get assignTeacherSuccess => 'Teacher assigned successfully!';

  @override
  String get assignTeacherCreateSuccess => 'Class created successfully!';
}
