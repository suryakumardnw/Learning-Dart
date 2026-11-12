import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:surya_learning_dart/models/app_user.dart';
import 'package:surya_learning_dart/screens/home_screen.dart';

void main() {
  const user = AppUser(
    id: 'usr-1',
    name: 'Surya Kumar',
    email: 'surya@example.com',
  );

  Future<void> pumpHome(WidgetTester tester) async {
    tester.view.physicalSize = const Size(1200, 2400);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const MaterialApp(home: HomeScreen(user: user)));
    await tester.pumpAndSettle();
  }

  testWidgets('renders the greeting, stats, and recent activity', (
    tester,
  ) async {
    await pumpHome(tester);

    expect(find.text('Dashboard'), findsOneWidget);
    expect(find.textContaining('Surya'), findsWidgets);
    expect(find.text('Day streak'), findsOneWidget);
    expect(find.text('34'), findsOneWidget);
    expect(find.text('Recent activity'), findsOneWidget);
    expect(find.text('Finished "Null safety" lesson'), findsOneWidget);
  });

  testWidgets('shows quick actions for profile and settings', (tester) async {
    await pumpHome(tester);

    expect(find.text('Quick actions'), findsOneWidget);
    expect(find.text('Edit profile'), findsOneWidget);
    expect(find.text('Settings'), findsOneWidget);
  });
}
