import 'package:flutter/material.dart';

/// Placeholder login screen — will support Learner LRN and Teacher email login.
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BASA AI — Login')),
      body: const Center(
        child: Text('Login Screen — Placeholder'),
      ),
    );
  }
}
