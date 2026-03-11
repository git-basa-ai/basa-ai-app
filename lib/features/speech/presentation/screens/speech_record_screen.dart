import 'package:flutter/material.dart';

import '../../../../app/theme/colors.dart';
import '../../../../app/theme/typography.dart';
import '../../../../shared/utils/constants.dart';
import '../../../../shared/widgets/bibo_mascot.dart';
import '../../../../shared/widgets/celebration_overlay.dart';

/// Speech recording screen where the learner reads a phoneme aloud.
class SpeechRecordScreen extends StatefulWidget {
  /// The phoneme or word to read aloud.
  final String phoneme;

  const SpeechRecordScreen({super.key, required this.phoneme});

  @override
  State<SpeechRecordScreen> createState() => _SpeechRecordScreenState();
}

enum _RecordState { idle, recording, processing, success, retry }

class _SpeechRecordScreenState extends State<SpeechRecordScreen>
    with SingleTickerProviderStateMixin {
  _RecordState _state = _RecordState.idle;
  late AnimationController _pulseController;
  bool _showCelebration = false;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  void _onMicTap() {
    switch (_state) {
      case _RecordState.idle:
      case _RecordState.retry:
        setState(() => _state = _RecordState.recording);
        _pulseController.repeat(reverse: true);
        // Simulate recording for 2 seconds, then evaluate.
        Future.delayed(const Duration(seconds: 2), () {
          if (!mounted) return;
          _pulseController.stop();
          setState(() => _state = _RecordState.processing);
          // Simulate processing.
          Future.delayed(const Duration(milliseconds: 800), () {
            if (!mounted) return;
            setState(() {
              _state = _RecordState.success;
              _showCelebration = true;
            });
            Future.delayed(const Duration(seconds: 2), () {
              if (!mounted) return;
              setState(() => _showCelebration = false);
            });
          });
        });
      case _RecordState.recording:
        // Stop early.
        _pulseController.stop();
        setState(() => _state = _RecordState.processing);
      case _RecordState.processing:
        break;
      case _RecordState.success:
        if (Navigator.of(context).canPop()) Navigator.of(context).pop();
    }
  }

  String get _statusText {
    switch (_state) {
      case _RecordState.idle:
        return 'Tap the mic and say:';
      case _RecordState.recording:
        return 'Listening…';
      case _RecordState.processing:
        return 'Checking…';
      case _RecordState.success:
        return 'Great job!';
      case _RecordState.retry:
        return 'Try again!';
    }
  }

  BiboMood get _biboMood {
    switch (_state) {
      case _RecordState.idle:
        return BiboMood.happy;
      case _RecordState.recording:
        return BiboMood.thinking;
      case _RecordState.processing:
        return BiboMood.thinking;
      case _RecordState.success:
        return BiboMood.celebrating;
      case _RecordState.retry:
        return BiboMood.encouraging;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          'Speak Now',
          style:
              AppTypography.heading3.copyWith(color: AppColors.textOnPrimary),
        ),
      ),
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(Spacing.xl),
              child: Column(
                children: [
                  const Spacer(),
                  BiboMascot(
                    mood: _biboMood,
                    size: BiboSize.large,
                    message: _statusText,
                  ),
                  const SizedBox(height: Spacing.xl),
                  Text(_statusText, style: AppTypography.bodyLarge),
                  const SizedBox(height: Spacing.lg),
                  // Phoneme card
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Spacing.xxl,
                      vertical: Spacing.lg,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.circular(Radii.lg),
                      border: Border.all(
                        color: AppColors.primary.withOpacity(0.3),
                        width: 2,
                      ),
                    ),
                    child: Text(
                      widget.phoneme,
                      style: AppTypography.heading1
                          .copyWith(color: AppColors.primary, fontSize: 48),
                    ),
                  ),
                  const SizedBox(height: Spacing.xxxl),
                  // Microphone button
                  AnimatedBuilder(
                    animation: _pulseController,
                    builder: (context, child) {
                      final scale = _state == _RecordState.recording
                          ? 1.0 + (_pulseController.value * 0.15)
                          : 1.0;
                      return Transform.scale(
                        scale: scale,
                        child: child,
                      );
                    },
                    child: GestureDetector(
                      onTap:
                          _state == _RecordState.processing ? null : _onMicTap,
                      child: Container(
                        width: 88,
                        height: 88,
                        decoration: BoxDecoration(
                          color: _state == _RecordState.recording
                              ? AppColors.error
                              : _state == _RecordState.success
                                  ? AppColors.success
                                  : AppColors.primary,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primary.withOpacity(0.3),
                              blurRadius: 12,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Icon(
                          _state == _RecordState.success
                              ? Icons.check
                              : _state == _RecordState.recording
                                  ? Icons.stop_rounded
                                  : Icons.mic,
                          color: AppColors.textOnPrimary,
                          size: 40,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: Spacing.lg),
                  if (_state == _RecordState.processing)
                    const SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  const Spacer(),
                ],
              ),
            ),
          ),
          if (_showCelebration)
            CelebrationOverlay(
              isVisible: _showCelebration,
              message: 'Magaling!',
              onDismiss: () => setState(() => _showCelebration = false),
            ),
        ],
      ),
    );
  }
}
