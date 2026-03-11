import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../app/theme/colors.dart';
import '../../../../app/theme/typography.dart';
import '../../../../shared/utils/constants.dart';
import '../../../../shared/widgets/bibo_mascot.dart';
import '../../../../shared/widgets/loading_overlay.dart';
import '../providers/auth_provider.dart';

/// Coordinator login screen — email + password with "Coordinator" role badge.
class CoordinatorLoginScreen extends ConsumerStatefulWidget {
  const CoordinatorLoginScreen({super.key});

  @override
  ConsumerState<CoordinatorLoginScreen> createState() =>
      _CoordinatorLoginScreenState();
}

class _CoordinatorLoginScreenState
    extends ConsumerState<CoordinatorLoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    final email = _emailController.text.trim();
    final password = _passwordController.text;
    if (email.isEmpty || password.isEmpty) return;
    setState(() => _isLoading = true);
    Future.delayed(AppDurations.normal, () {
      if (!mounted) return;
      ref.read(authProvider.notifier).loginAsCoordinator(email, password);
      setState(() => _isLoading = false);
      context.go('/coordinator');
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    const accent = AppColors.success;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: Spacing.xxl),
              child: Column(
                children: [
                  const SizedBox(height: Spacing.lg),

                  // Back button
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () => context.go('/role-selection'),
                      icon: const Icon(Iconsax.arrow_left),
                      style: IconButton.styleFrom(
                        backgroundColor: AppColors.surface,
                        shape: const CircleBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(height: Spacing.md),

                  // Bibo mascot
                  BiboMascot(
                    message: l10n.coordinatorLoginBiboMessage,
                    mood: BiboMood.encouraging,
                    size: BiboSize.large,
                  ),
                  const SizedBox(height: Spacing.xxl),

                  // Title
                  Text(l10n.loginTitle, style: AppTypography.heading1),
                  const SizedBox(height: Spacing.md),

                  // Role badge
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Spacing.lg,
                      vertical: Spacing.sm,
                    ),
                    decoration: BoxDecoration(
                      color: accent.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(Radii.pill),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Iconsax.chart_square,
                          size: 18,
                          color: accent,
                        ),
                        const SizedBox(width: Spacing.sm),
                        Text(
                          l10n.roleSelectionCoordinator,
                          style:
                              AppTypography.labelMedium.copyWith(color: accent),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: Spacing.xxxl),

                  // Form card
                  Container(
                    padding: const EdgeInsets.all(Spacing.xxl),
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.circular(Radii.xl),
                      border: Border.all(
                        color: accent.withOpacity(0.2),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: accent.withOpacity(0.06),
                          blurRadius: 20,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(l10n.coordinatorLoginEmailLabel,
                            style: AppTypography.labelMedium),
                        const SizedBox(height: Spacing.sm),
                        TextField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          style: AppTypography.bodyLarge,
                          decoration: InputDecoration(
                            hintText: l10n.coordinatorLoginEmailHint,
                            prefixIcon: const Icon(Iconsax.sms),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(Radii.md),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(Radii.md),
                              borderSide:
                                  const BorderSide(color: accent, width: 2),
                            ),
                          ),
                        ),
                        const SizedBox(height: Spacing.lg),
                        Text(l10n.coordinatorLoginPasswordLabel,
                            style: AppTypography.labelMedium),
                        const SizedBox(height: Spacing.sm),
                        TextField(
                          controller: _passwordController,
                          obscureText: _obscurePassword,
                          style: AppTypography.bodyLarge,
                          decoration: InputDecoration(
                            hintText: l10n.coordinatorLoginPasswordHint,
                            prefixIcon: const Icon(Iconsax.lock),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscurePassword
                                    ? Iconsax.eye_slash
                                    : Iconsax.eye,
                              ),
                              onPressed: () => setState(
                                  () => _obscurePassword = !_obscurePassword),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(Radii.md),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(Radii.md),
                              borderSide:
                                  const BorderSide(color: accent, width: 2),
                            ),
                          ),
                        ),
                        const SizedBox(height: Spacing.xxl),
                        SizedBox(
                          width: double.infinity,
                          height: TouchTargets.buttonHeight,
                          child: FilledButton(
                            onPressed: _handleLogin,
                            style: FilledButton.styleFrom(
                              backgroundColor: accent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(Radii.md),
                              ),
                            ),
                            child: Text(
                              l10n.coordinatorLoginButton,
                              style: AppTypography.labelLarge
                                  .copyWith(color: AppColors.textOnPrimary),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: Spacing.xxxl),
                ],
              ),
            ),
          ),
          LoadingOverlay(isLoading: _isLoading),
        ],
      ),
    );
  }
}
