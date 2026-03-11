import 'package:flutter/material.dart';

/// Placeholder quiz / answer screen.
class QuizScreen extends StatelessWidget {
  /// The lesson identifier for this quiz.
  final String lessonId;

  const QuizScreen({super.key, required this.lessonId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Quiz')),
      body: Center(
        child: Text('Quiz Screen — $lessonId — Placeholder'),
      ),
    );
  }
}
