import 'package:flutter/material.dart';

/// Placeholder phonics lesson list screen.
class LessonListScreen extends StatelessWidget {
  const LessonListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lessons')),
      body: const Center(
        child: Text('Lesson List Screen — Placeholder'),
      ),
    );
  }
}
