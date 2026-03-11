import 'package:flutter/material.dart';

/// Placeholder mouth movement guide screen (FaceMesh overlay).
class MouthGuideScreen extends StatelessWidget {
  const MouthGuideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mouth Guide')),
      body: const Center(
        child: Text('Mouth Movement Guide Screen — Placeholder'),
      ),
    );
  }
}
