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
import '../../domain/entities/user_role.dart';
import '../providers/auth_provider.dart';

/// Role-specific login screen.
///
/// Pass [role] = `learner` or `teacher` to display only that role's form.
class LoginScreen extends ConsumerStatefulWidget {
  final String role;

  const LoginScreen({super.key, required this.role});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _lrnController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _obscurePassword = true;

  bool get _isLearner => widget.role == 'learner';

  @override
  void dispose() {
    _lrnController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _loginAsLearner() {
    final lrn = _lrnController.text.trim();
    if (lrn.isEmpty) return;
    setState(() => _isLoading = true);
    Future.delayed(AppDurations.normal, () {
      if (!mounted) return;
      ref.read(authProvider.notifier).loginAsLearner(lrn);
      setState(() => _isLoading = false);
      context.go('/learner');
    });
  }

  void _loginAsTeacher() {
    final email = _emailController.text.trim();
    final password = _passwordController.text;
    if (email.isEmpty || password.isEmpty) return;
    setState(() => _isLoading = true);
    Future.delayed(AppDurations.normal, () {
      if (!mounted) return;
      ref.read(authProvider.notifier).loginAsTeacher(email, password);
      setState(() => _isLoading = false);
      context.go('/teacher');
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final authState = ref.watch(authProvider);

    // Route guard: if already authenticated, redirect.
    authState.whenOrNull(
      authenticated: (uid, name, role) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (role == UserRole.learner) {
            context.go('/learner');
          } else if (role == UserRole.teacher) {
            context.go('/teacher');
          } else {
            context.go('/coordinator');
          }
        });
      },
    );

    final roleColor = _isLearner ? AppColors.primary : AppColors.secondary;
    final roleLabel = _isLearner ? l10n.loginLearnerTab : l10n.loginTeacherTab;
    final biboMessage =
        _isLearner ? l10n.loginBiboWelcome : l10n.loginBiboTeacher;

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

                  // Back row
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
                    message: biboMessage,
                    mood: BiboMood.happy,
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
                      color: roleColor.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(Radii.pill),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          _isLearner ? Iconsax.book : Iconsax.teacher,
                          size: 18,
                          color: roleColor,
                        ),
                        const SizedBox(width: Spacing.sm),
                        Text(
                          roleLabel,
                          style: AppTypography.labelMedium
                              .copyWith(color: roleColor),
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
                        color: roleColor.withOpacity(0.2),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: roleColor.withOpacity(0.06),
                          blurRadius: 20,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: _isLearner
                        ? _buildLearnerForm(l10n, roleColor)
                        : _buildTeacherForm(l10n, roleColor),
                  ),

                  const SizedBox(height: Spacing.xxxl),
                ],
              ),
            ),
          ),
          LoadingOverlay(isLoading: _isLoading, message: l10n.generalLoading),
        ],
      ),
    );
  }

  Widget _buildLearnerForm(AppLocalizations l10n, Color accent) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(l10n.loginLrnLabel, style: AppTypography.labelMedium),
        const SizedBox(height: Spacing.sm),
        TextField(
          controller: _lrnController,
          keyboardType: TextInputType.number,
          style: AppTypography.bodyLarge,
          decoration: InputDecoration(
            hintText: l10n.loginLrnHint,
            prefixIcon: const Icon(Iconsax.card),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Radii.md),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Radii.md),
              borderSide: BorderSide(color: accent, width: 2),
            ),
          ),
        ),
        const SizedBox(height: Spacing.xxl),
        SizedBox(
          width: double.infinity,
          height: TouchTargets.buttonHeight,
          child: FilledButton(
            onPressed: _loginAsLearner,
            style: FilledButton.styleFrom(
              backgroundColor: accent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Radii.md),
              ),
            ),
            child: Text(
              l10n.loginEnterButton,
              style: AppTypography.labelLarge
                  .copyWith(color: AppColors.textOnPrimary),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTeacherForm(AppLocalizations l10n, Color accent) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(l10n.loginTeacherEmailLabel, style: AppTypography.labelMedium),
        const SizedBox(height: Spacing.sm),
        TextField(
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          style: AppTypography.bodyLarge,
          decoration: InputDecoration(
            hintText: l10n.loginTeacherEmailHint,
            prefixIcon: const Icon(Iconsax.sms),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Radii.md),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Radii.md),
              borderSide: BorderSide(color: accent, width: 2),
            ),
          ),
        ),
        const SizedBox(height: Spacing.lg),
        Text(l10n.loginTeacherPasswordLabel, style: AppTypography.labelMedium),
        const SizedBox(height: Spacing.sm),
        TextField(
          controller: _passwordController,
          obscureText: _obscurePassword,
          style: AppTypography.bodyLarge,
          decoration: InputDecoration(
            hintText: l10n.loginTeacherPasswordHint,
            prefixIcon: const Icon(Iconsax.lock),
            suffixIcon: IconButton(
              icon: Icon(
                _obscurePassword ? Iconsax.eye_slash : Iconsax.eye,
              ),
              onPressed: () =>
                  setState(() => _obscurePassword = !_obscurePassword),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Radii.md),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Radii.md),
              borderSide: BorderSide(color: accent, width: 2),
            ),
          ),
        ),
        const SizedBox(height: Spacing.xxl),
        SizedBox(
          width: double.infinity,
          height: TouchTargets.buttonHeight,
          child: FilledButton(
            onPressed: _loginAsTeacher,
            style: FilledButton.styleFrom(
              backgroundColor: accent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Radii.md),
              ),
            ),
            child: Text(
              l10n.loginTeacherButton,
              style: AppTypography.labelLarge
                  .copyWith(color: AppColors.textOnPrimary),
            ),
          ),
        ),
      ],
    );
  }
}
