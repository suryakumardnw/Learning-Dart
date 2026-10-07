import 'package:flutter/material.dart';
import 'package:surya_learning_dart/theme/app_theme_data.dart';

/// Provides [AppThemeData] to descendants via [AppTheme.of].
class AppTheme extends InheritedWidget {
  const AppTheme({super.key, required this.data, required super.child});

  final AppThemeData data;

  static AppThemeData of(BuildContext context) {
    final inherited = context.dependOnInheritedWidgetOfExactType<AppTheme>();
    assert(inherited != null, 'AppTheme.of() called with no AppTheme ancestor');
    return inherited!.data;
  }

  static AppThemeData? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppTheme>()?.data;
  }

  @override
  bool updateShouldNotify(AppTheme oldWidget) => data != oldWidget.data;
}
