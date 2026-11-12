import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:surya_learning_dart/theme/app_theme.dart';
import 'package:surya_learning_dart/theme/app_theme_data.dart';
import 'package:surya_learning_dart/widgets/login_widget.dart';

void main() {
  testWidgets('login screen renders its fields and actions', (tester) async {
    await tester.pumpWidget(
      AppTheme(
        data: AppThemeData.light,
        child: const MaterialApp(home: Scaffold(body: LoginWidget())),
      ),
    );

    expect(find.text('Login'), findsWidgets);
    expect(find.text('Email address'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.text('Forgot password?'), findsOneWidget);
    expect(find.text('Register'), findsOneWidget);
  });
}
