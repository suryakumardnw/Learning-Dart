import 'package:flutter/material.dart';
import 'package:surya_learning_dart/router/app_router.dart';
import 'package:surya_learning_dart/theme/app_theme.dart';
import 'package:surya_learning_dart/theme/app_theme_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTheme(
      data: AppThemeData.light,
      child: const _RootRouter(),
    );
  }
}

class _RootRouter extends StatelessWidget {
  const _RootRouter();

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);

    return MaterialApp.router(
      title: 'Surya Learning Dart',
      theme: appTheme.toMaterialTheme(),
      routerConfig: appRouter,
    );
  }
}
