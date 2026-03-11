import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/theme/colors.dart';
import '../../../../app/theme/typography.dart';
import '../../../../shared/utils/constants.dart';
import '../../../../shared/widgets/bibo_mascot.dart';
import '../../../../shared/widgets/loading_overlay.dart';
import '../../domain/entities/user_role.dart';
import '../providers/auth_provider.dart';

/// Login screen with tabs for Learner (LRN) and Teacher (email/password).
class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  final _lrnController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
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
          } else {
            context.go('/teacher');
          }
        });
      },
    );

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(Spacing.xxl),
              child: Column(
                children: [
                  const SizedBox(height: Spacing.xxxl),
                  BiboMascot(
                    message: _tabController.index == 0
                        ? l10n.loginBiboWelcome
                        : l10n.loginBiboTeacher,
                    mood: BiboMood.happy,
                    size: BiboSize.large,
                  ),
                  const SizedBox(height: Spacing.xxl),
                  Text(l10n.loginTitle, style: AppTypography.heading1),
                  const SizedBox(height: Spacing.xxl),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.circular(Radii.lg),
                    ),
                    child: TabBar(
                      controller: _tabController,
                      onTap: (_) => setState(() {}),
                      labelColor: AppColors.primary,
                      unselectedLabelColor: AppColors.textSecondary,
                      indicatorSize: TabBarIndicatorSize.tab,
                      labelStyle: AppTypography.labelLarge,
                      unselectedLabelStyle: AppTypography.bodyMedium,
                      tabs: [
                        Tab(text: l10n.loginLearnerTab),
                        Tab(text: l10n.loginTeacherTab),
                      ],
                    ),
                  ),
                  const SizedBox(height: Spacing.xxl),
                  AnimatedSwitcher(
                    duration: AppDurations.fast,
                    child: _tabController.index == 0
                        ? _buildLearnerForm(l10n)
                        : _buildTeacherForm(l10n),
                  ),
                ],
              ),
            ),
          ),
          LoadingOverlay(isLoading: _isLoading, message: l10n.generalLoading),
        ],
      ),
    );
  }

  Widget _buildLearnerForm(AppLocalizations l10n) {
    return Column(
      key: const ValueKey('learner-form'),
      children: [
        TextField(
          controller: _lrnController,
          keyboardType: TextInputType.number,
          style: AppTypography.bodyLarge,
          decoration: InputDecoration(
            hintText: l10n.loginLrnHint,
            labelText: l10n.loginLrnLabel,
            prefixIcon: const Icon(Icons.badge_outlined),
          ),
        ),
        const SizedBox(height: Spacing.xxl),
        SizedBox(
          width: double.infinity,
          height: TouchTargets.buttonHeight,
          child: ElevatedButton(
            onPressed: _loginAsLearner,
            child: Text(l10n.loginEnterButton),
          ),
        ),
      ],
    );
  }

  Widget _buildTeacherForm(AppLocalizations l10n) {
    return Column(
      key: const ValueKey('teacher-form'),
      children: [
        TextField(
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          style: AppTypography.bodyLarge,
          decoration: InputDecoration(
            hintText: l10n.loginTeacherEmailHint,
            labelText: l10n.loginTeacherEmailLabel,
            prefixIcon: const Icon(Icons.email_outlined),
          ),
        ),
        const SizedBox(height: Spacing.lg),
        TextField(
          controller: _passwordController,
          obscureText: true,
          style: AppTypography.bodyLarge,
          decoration: InputDecoration(
            hintText: l10n.loginTeacherPasswordHint,
            labelText: l10n.loginTeacherPasswordLabel,
            prefixIcon: const Icon(Icons.lock_outlined),
          ),
        ),
        const SizedBox(height: Spacing.xxl),
        SizedBox(
          width: double.infinity,
          height: TouchTargets.buttonHeight,
          child: ElevatedButton(
            onPressed: _loginAsTeacher,
            child: Text(l10n.loginTeacherButton),
          ),
        ),
      ],
    );
  }
}
