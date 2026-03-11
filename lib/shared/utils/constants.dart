/// Named constants used throughout the BASA AI application (Rule C5).
///
/// All magic numbers must be replaced with named constants defined here.
library;

/// Spacing constants for consistent padding and margins.
class Spacing {
  Spacing._();

  static const double xs = 4;
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 20;
  static const double xxl = 24;
  static const double xxxl = 32;
}

/// Border radius constants.
class Radii {
  Radii._();

  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 20;
  static const double pill = 9999;
}

/// Animation duration constants.
class AppDurations {
  AppDurations._();

  static const Duration fast = Duration(milliseconds: 150);
  static const Duration normal = Duration(milliseconds: 300);
  static const Duration slow = Duration(milliseconds: 600);
  static const Duration celebration = Duration(milliseconds: 3000);
  static const Duration feedbackDelay = Duration(milliseconds: 800);
}

/// Minimum touch target sizes (Rule U1).
class TouchTargets {
  TouchTargets._();

  static const double minSize = 48;
  static const double buttonHeight = 48;
}

/// XP and level progression constants.
class XpConstants {
  XpConstants._();

  static const int xpPerLesson = 10;
  static const int xpPerQuiz = 15;
  static const int xpPerPerfectQuiz = 25;
  static const int xpPerLevel = 100;
  static const int maxLevel = 50;
}

/// Quiz constants.
class QuizConstants {
  QuizConstants._();

  static const int questionsPerQuiz = 5;
  static const int answersPerQuestion = 4;
}

/// Grid layout constants.
class GridConstants {
  GridConstants._();

  static const int dictionaryColumns = 2;
  static const int answerColumns = 2;
  static const double gridSpacing = 12;
}
