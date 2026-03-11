import 'package:flutter/material.dart';

import 'router.dart';
import 'theme/theme.dart';

/// Root widget for the BASA AI application.
class BasaAiApp extends StatelessWidget {
  const BasaAiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'BASA AI',
      theme: AppTheme.lightTheme,
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
