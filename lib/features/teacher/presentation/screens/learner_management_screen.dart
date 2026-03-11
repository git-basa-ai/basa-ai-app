import 'package:flutter/material.dart';

/// Placeholder learner management screen (teacher enrolls / manages learners).
class LearnerManagementScreen extends StatelessWidget {
  const LearnerManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Manage Learners')),
      body: const Center(
        child: Text('Learner Management Screen — Placeholder'),
      ),
    );
  }
}
