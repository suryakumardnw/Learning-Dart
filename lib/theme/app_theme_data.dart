import 'package:flutter/material.dart';

class AppThemeData {
  const AppThemeData({
    required this.primaryColor,
    required this.onPrimaryColor,
    required this.scaffoldBackgroundColor,
    required this.cardColor,
    required this.mutedTextColor,
  });

  final Color primaryColor;
  final Color onPrimaryColor;
  final Color scaffoldBackgroundColor;
  final Color cardColor;
  final Color mutedTextColor;

  static const light = AppThemeData(
    primaryColor: Colors.blue,
    onPrimaryColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    cardColor: Color(0xFFF3F6FB),
    mutedTextColor: Color(0xFF5F6B7A),
  );

  ThemeData toMaterialTheme() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        primary: primaryColor,
        onPrimary: onPrimaryColor,
      ),
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      cardColor: cardColor,
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        centerTitle: false,
      ),
      dividerTheme: DividerThemeData(
        color: mutedTextColor.withAlpha(32),
        thickness: 1,
      ),
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is AppThemeData &&
            primaryColor == other.primaryColor &&
            onPrimaryColor == other.onPrimaryColor &&
            scaffoldBackgroundColor == other.scaffoldBackgroundColor &&
            cardColor == other.cardColor &&
            mutedTextColor == other.mutedTextColor;
  }

  @override
  int get hashCode => Object.hash(
    primaryColor,
    onPrimaryColor,
    scaffoldBackgroundColor,
    cardColor,
    mutedTextColor,
  );
}
