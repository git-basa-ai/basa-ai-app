import 'package:flutter/material.dart';

/// Placeholder speech recording screen.
class SpeechRecordScreen extends StatelessWidget {
  const SpeechRecordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Speak Now')),
      body: const Center(
        child: Text('Speech Record Screen — Placeholder'),
      ),
    );
  }
}
