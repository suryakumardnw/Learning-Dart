import 'package:flutter_test/flutter_test.dart';

import 'package:surya_learning_dart/main.dart';

void main() {
  testWidgets('app renders the login screen on startup', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    expect(find.text('Login'), findsOneWidget);
  });
}
