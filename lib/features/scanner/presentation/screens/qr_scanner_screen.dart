import 'package:flutter/material.dart';

/// Placeholder QR code scanner screen.
class QrScannerScreen extends StatelessWidget {
  const QrScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scan QR Code')),
      body: const Center(
        child: Text('QR Scanner Screen — Placeholder'),
      ),
    );
  }
}
