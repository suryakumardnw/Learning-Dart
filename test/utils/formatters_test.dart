import 'package:flutter_test/flutter_test.dart';
import 'package:surya_learning_dart/utils/formatters.dart';

void main() {
  group('name helpers', () {
    test('firstNameOf returns the first word', () {
      expect(Formatters.firstNameOf('Surya Kumar'), 'Surya');
    });

    test('firstNameOf falls back for empty input', () {
      expect(Formatters.firstNameOf('   '), 'Learner');
    });

    test('initialsOf returns two letters for full names', () {
      expect(Formatters.initialsOf('Surya Kumar'), 'SK');
    });

    test('initialsOf handles a single name', () {
      expect(Formatters.initialsOf('Surya'), 'S');
    });

    test('initialsOf handles empty input', () {
      expect(Formatters.initialsOf(''), '?');
    });
  });

  group('date helpers', () {
    test('formatDate renders a readable date', () {
      expect(Formatters.formatDate(DateTime(2025, 1, 15)), 'Jan 15, 2025');
    });

    test('formatRelativeTime handles minutes', () {
      final now = DateTime(2026, 1, 1, 12);
      expect(
        Formatters.formatRelativeTime(
          now.subtract(const Duration(minutes: 5)),
          now: now,
        ),
        '5m ago',
      );
    });

    test('formatRelativeTime handles seconds', () {
      final now = DateTime(2026, 1, 1, 12);
      expect(
        Formatters.formatRelativeTime(
          now.subtract(const Duration(seconds: 10)),
          now: now,
        ),
        'Just now',
      );
    });

    test('formatRelativeTime handles days', () {
      final now = DateTime(2026, 1, 1, 12);
      expect(
        Formatters.formatRelativeTime(
          now.subtract(const Duration(days: 2)),
          now: now,
        ),
        '2d ago',
      );
    });

    test('formatRelativeTime falls back to a date after a week', () {
      final now = DateTime(2026, 1, 20, 12);
      expect(
        Formatters.formatRelativeTime(
          now.subtract(const Duration(days: 10)),
          now: now,
        ),
        'Jan 10, 2026',
      );
    });
  });

  group('number helpers', () {
    test('compactNumber leaves small numbers alone', () {
      expect(Formatters.compactNumber(999), '999');
    });

    test('compactNumber adds a k suffix', () {
      expect(Formatters.compactNumber(1500), '1.5k');
      expect(Formatters.compactNumber(2000), '2k');
    });

    test('capitalize uppercases the first letter', () {
      expect(Formatters.capitalize('dart'), 'Dart');
    });
  });
}
