import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A teacher feedback note.
class FeedbackNote {
  final String id;
  final String date;
  final String text;

  const FeedbackNote({
    required this.id,
    required this.date,
    required this.text,
  });
}

final _mockFeedbackNotes = <FeedbackNote>[
  const FeedbackNote(
    id: 'fb-1',
    date: 'Mar 10, 2026',
    text:
        'Juan is showing improvement in vowel recognition. Encourage more practice with Ee and Oo sounds.',
  ),
  const FeedbackNote(
    id: 'fb-2',
    date: 'Mar 7, 2026',
    text:
        'Struggling with blending consonant-vowel pairs. Suggested extra mouth guide practice.',
  ),
];

class MockFeedbackNotifier extends StateNotifier<List<FeedbackNote>> {
  MockFeedbackNotifier() : super(_mockFeedbackNotes);

  void addNote(String text) {
    final note = FeedbackNote(
      id: 'fb-${state.length + 1}',
      date: 'Mar 11, 2026',
      text: text,
    );
    state = [note, ...state];
  }
}

/// Phase 3 stub — will be replaced with Firestore-backed provider in Phase 4.
final feedbackProvider =
    StateNotifierProvider<MockFeedbackNotifier, List<FeedbackNote>>((ref) {
  return MockFeedbackNotifier();
});
