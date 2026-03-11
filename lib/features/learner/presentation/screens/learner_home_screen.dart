import 'package:flutter/material.dart';

/// Placeholder learner home screen.
class LearnerHomeScreen extends StatelessWidget {
  const LearnerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: const Center(
        child: Text('Learner Home Screen — Placeholder'),
      ),
    );
  }
}
