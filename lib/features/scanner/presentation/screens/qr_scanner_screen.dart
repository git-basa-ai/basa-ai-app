import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/theme/colors.dart';
import '../../../../app/theme/typography.dart';
import '../../../../shared/utils/constants.dart';
import '../../../../shared/widgets/bibo_mascot.dart';
import '../../../../shared/widgets/celebration_overlay.dart';
import '../providers/scanner_provider.dart';

/// QR code scanner screen with camera placeholder and scan states.
class QrScannerScreen extends ConsumerWidget {
  const QrScannerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final scanState = ref.watch(scannerProvider);
    final notifier = ref.read(scannerProvider.notifier);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          l10n.scannerTitle,
          style:
              AppTypography.heading3.copyWith(color: AppColors.textOnPrimary),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(Spacing.lg),
            child: Column(
              children: [
                BiboMascot(
                  message: _biboMessage(l10n, scanState),
                  mood: _biboMood(scanState),
                  size: BiboSize.medium,
                ),
                const SizedBox(height: Spacing.xxl),

                // Camera preview placeholder.
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.textPrimary.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(Radii.xl),
                      border: Border.all(
                        color: _borderColor(scanState),
                        width: 3,
                      ),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            _stateIcon(scanState),
                            size: 64,
                            color: _borderColor(scanState),
                          ),
                          const SizedBox(height: Spacing.lg),
                          Text(
                            _stateText(l10n, scanState),
                            style: AppTypography.bodyLarge,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: Spacing.xxl),

                // Scan / Reset button.
                SizedBox(
                  width: double.infinity,
                  height: TouchTargets.buttonHeight,
                  child: ElevatedButton.icon(
                    onPressed: scanState == ScannerState.scanning
                        ? null
                        : () {
                            if (scanState == ScannerState.idle) {
                              notifier.simulateScan();
                            } else {
                              notifier.reset();
                            }
                          },
                    icon: Icon(scanState == ScannerState.idle
                        ? Icons.qr_code_scanner_rounded
                        : Icons.refresh_rounded),
                    label: Text(scanState == ScannerState.idle
                        ? l10n.scannerInstruction
                        : l10n.generalRetry),
                  ),
                ),
              ],
            ),
          ),
          CelebrationOverlay(
            isVisible: scanState == ScannerState.success,
            message: l10n.scannerSuccess,
            onDismiss: () => notifier.reset(),
          ),
        ],
      ),
    );
  }

  String _biboMessage(AppLocalizations l10n, ScannerState state) {
    switch (state) {
      case ScannerState.idle:
        return l10n.scannerBiboMessage;
      case ScannerState.scanning:
        return l10n.generalLoading;
      case ScannerState.success:
        return l10n.scannerSuccess;
      case ScannerState.invalid:
        return l10n.scannerBiboError;
    }
  }

  BiboMood _biboMood(ScannerState state) {
    switch (state) {
      case ScannerState.idle:
        return BiboMood.happy;
      case ScannerState.scanning:
        return BiboMood.thinking;
      case ScannerState.success:
        return BiboMood.celebrating;
      case ScannerState.invalid:
        return BiboMood.encouraging;
    }
  }

  Color _borderColor(ScannerState state) {
    switch (state) {
      case ScannerState.idle:
      case ScannerState.scanning:
        return AppColors.primary;
      case ScannerState.success:
        return AppColors.success;
      case ScannerState.invalid:
        return AppColors.error;
    }
  }

  IconData _stateIcon(ScannerState state) {
    switch (state) {
      case ScannerState.idle:
        return Icons.qr_code_2_rounded;
      case ScannerState.scanning:
        return Icons.center_focus_strong_rounded;
      case ScannerState.success:
        return Icons.check_circle_rounded;
      case ScannerState.invalid:
        return Icons.error_outline_rounded;
    }
  }

  String _stateText(AppLocalizations l10n, ScannerState state) {
    switch (state) {
      case ScannerState.idle:
        return l10n.scannerInstruction;
      case ScannerState.scanning:
        return l10n.generalLoading;
      case ScannerState.success:
        return l10n.scannerSuccess;
      case ScannerState.invalid:
        return l10n.scannerInvalid;
    }
  }
}
