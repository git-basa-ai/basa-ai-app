import 'package:flutter/material.dart';

/// Placeholder picture dictionary screen.
class DictionaryScreen extends StatelessWidget {
  const DictionaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Picture Dictionary')),
      body: const Center(
        child: Text('Picture Dictionary Screen — Placeholder'),
      ),
    );
  }
}
