import 'package:flutter/material.dart';

/// Placeholder progress / XP / profile screen.
class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Progress')),
      body: const Center(
        child: Text('Progress Screen — Placeholder'),
      ),
    );
  }
}
