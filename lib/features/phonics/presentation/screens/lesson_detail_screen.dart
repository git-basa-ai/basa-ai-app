import 'package:flutter/material.dart';

/// Placeholder phonics lesson detail screen.
class LessonDetailScreen extends StatelessWidget {
  /// The lesson identifier from the route parameter.
  final String lessonId;

  const LessonDetailScreen({super.key, required this.lessonId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lesson')),
      body: Center(
        child: Text('Lesson Detail — $lessonId — Placeholder'),
      ),
    );
  }
}
