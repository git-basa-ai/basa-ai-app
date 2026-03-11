import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Scanner result state.
enum ScannerState {
  /// Idle — camera preview shown.
  idle,

  /// Scanning in progress.
  scanning,

  /// QR code successfully scanned.
  success,

  /// Invalid QR code.
  invalid,
}

/// Mock scanner notifier that simulates QR code scanning.
///
/// Phase 3 stub — will be replaced with ML Kit integration in Phase 4.
class MockScannerNotifier extends StateNotifier<ScannerState> {
  MockScannerNotifier() : super(ScannerState.idle);

  /// Simulate a successful scan.
  void simulateScan({bool valid = true}) {
    state = ScannerState.scanning;
    Future.delayed(const Duration(milliseconds: 1500), () {
      if (mounted) {
        state = valid ? ScannerState.success : ScannerState.invalid;
      }
    });
  }

  /// Reset scanner back to idle.
  void reset() {
    state = ScannerState.idle;
  }
}

/// Provides scanner state.
final scannerProvider =
    StateNotifierProvider<MockScannerNotifier, ScannerState>((ref) {
  return MockScannerNotifier();
});
