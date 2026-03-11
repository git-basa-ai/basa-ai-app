import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/quiz_question.dart';

/// Mock quiz question data for a given lesson.
final _mockQuestions = <String, List<QuizQuestion>>{
  'lesson-aa': [
    const QuizQuestion(
      id: 'q-aa-1',
      questionText: 'Ano ang tunog ng letrang Aa?',
      choices: ['ah', 'bah', 'kah', 'dah'],
      correctAnswer: 'ah',
      lessonId: 'lesson-aa',
    ),
    const QuizQuestion(
      id: 'q-aa-2',
      questionText: 'Alin ang may tunog na Aa?',
      choices: ['aso', 'bata', 'keso', 'daga'],
      correctAnswer: 'aso',
      lessonId: 'lesson-aa',
    ),
    const QuizQuestion(
      id: 'q-aa-3',
      questionText: 'Alin ang salitang nagsisimula sa Aa?',
      choices: ['ate', 'bola', 'kamay', 'daliri'],
      correctAnswer: 'ate',
      lessonId: 'lesson-aa',
    ),
    const QuizQuestion(
      id: 'q-aa-4',
      questionText: 'Ano ang nasa larawan?',
      choices: ['aklat', 'baso', 'kama', 'damo'],
      correctAnswer: 'aklat',
      lessonId: 'lesson-aa',
    ),
    const QuizQuestion(
      id: 'q-aa-5',
      questionText: 'Piliin ang tamang letra.',
      choices: ['Aa', 'Bb', 'Kk', 'Dd'],
      correctAnswer: 'Aa',
      lessonId: 'lesson-aa',
    ),
  ],
};

/// Default questions for lessons without specific mock data.
final _defaultQuestions = <QuizQuestion>[
  const QuizQuestion(
    id: 'q-default-1',
    questionText: 'Ano ang tunog ng letrang ito?',
    choices: ['Tama', 'Mali A', 'Mali B', 'Mali C'],
    correctAnswer: 'Tama',
    lessonId: 'default',
  ),
  const QuizQuestion(
    id: 'q-default-2',
    questionText: 'Alin ang tamang salita?',
    choices: ['Mali A', 'Tama', 'Mali B', 'Mali C'],
    correctAnswer: 'Tama',
    lessonId: 'default',
  ),
  const QuizQuestion(
    id: 'q-default-3',
    questionText: 'Piliin ang tamang sagot.',
    choices: ['Mali A', 'Mali B', 'Tama', 'Mali C'],
    correctAnswer: 'Tama',
    lessonId: 'default',
  ),
  const QuizQuestion(
    id: 'q-default-4',
    questionText: 'Ano ang nasa larawan?',
    choices: ['Mali A', 'Mali B', 'Mali C', 'Tama'],
    correctAnswer: 'Tama',
    lessonId: 'default',
  ),
  const QuizQuestion(
    id: 'q-default-5',
    questionText: 'Alin ang tamang letra?',
    choices: ['Tama', 'Mali A', 'Mali B', 'Mali C'],
    correctAnswer: 'Tama',
    lessonId: 'default',
  ),
];

/// Quiz state managed by the notifier.
class QuizState {
  final List<QuizQuestion> questions;
  final int currentIndex;
  final int score;
  final String? selectedAnswer;
  final bool answered;
  final bool quizComplete;

  const QuizState({
    required this.questions,
    this.currentIndex = 0,
    this.score = 0,
    this.selectedAnswer,
    this.answered = false,
    this.quizComplete = false,
  });

  QuizState copyWith({
    List<QuizQuestion>? questions,
    int? currentIndex,
    int? score,
    String? selectedAnswer,
    bool? answered,
    bool? quizComplete,
  }) {
    return QuizState(
      questions: questions ?? this.questions,
      currentIndex: currentIndex ?? this.currentIndex,
      score: score ?? this.score,
      selectedAnswer: selectedAnswer ?? this.selectedAnswer,
      answered: answered ?? this.answered,
      quizComplete: quizComplete ?? this.quizComplete,
    );
  }

  /// The current question, or null if the quiz is complete.
  QuizQuestion? get currentQuestion =>
      currentIndex < questions.length ? questions[currentIndex] : null;
}

/// Mock quiz notifier that handles answer selection and scoring.
///
/// Phase 3 stub — will be replaced with repository-backed notifier in Phase 4.
class MockQuizNotifier extends StateNotifier<QuizState> {
  MockQuizNotifier(String lessonId)
      : super(QuizState(
          questions: _mockQuestions[lessonId] ?? _defaultQuestions,
        ));

  /// Select an answer for the current question.
  void selectAnswer(String answer) {
    if (state.answered) return;
    final isCorrect = answer == state.currentQuestion?.correctAnswer;
    state = state.copyWith(
      selectedAnswer: answer,
      answered: true,
      score: isCorrect ? state.score + 1 : state.score,
    );
  }

  /// Move to the next question.
  void nextQuestion() {
    final nextIndex = state.currentIndex + 1;
    if (nextIndex >= state.questions.length) {
      state = state.copyWith(quizComplete: true);
    } else {
      state = QuizState(
        questions: state.questions,
        currentIndex: nextIndex,
        score: state.score,
      );
    }
  }
}

/// Provides quiz state for a given lesson ID.
final quizProvider =
    StateNotifierProvider.family<MockQuizNotifier, QuizState, String>(
        (ref, lessonId) {
  return MockQuizNotifier(lessonId);
});
