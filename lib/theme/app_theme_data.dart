import 'package:flutter/material.dart';

class AppThemeData {
  const AppThemeData({
    required this.primaryColor,
    required this.onPrimaryColor,
    required this.scaffoldBackgroundColor,
  });

  final Color primaryColor;
  final Color onPrimaryColor;
  final Color scaffoldBackgroundColor;

  static const light = AppThemeData(
    primaryColor: Colors.blue,
    onPrimaryColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
  );

  ThemeData toMaterialTheme() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        primary: primaryColor,
        onPrimary: onPrimaryColor,
      ),
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      useMaterial3: true,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is AppThemeData &&
            primaryColor == other.primaryColor &&
            onPrimaryColor == other.onPrimaryColor &&
            scaffoldBackgroundColor == other.scaffoldBackgroundColor;
  }

  @override
  int get hashCode =>
      Object.hash(primaryColor, onPrimaryColor, scaffoldBackgroundColor);
}
