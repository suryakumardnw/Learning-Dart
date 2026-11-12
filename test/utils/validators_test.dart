import 'package:flutter_test/flutter_test.dart';
import 'package:surya_learning_dart/utils/validators.dart';

void main() {
  group('Validators.email', () {
    test('requires a value', () {
      expect(Validators.email(null), 'Email is required');
      expect(Validators.email('   '), 'Email is required');
    });

    test('rejects malformed addresses', () {
      expect(Validators.email('surya'), 'Enter a valid email address');
      expect(Validators.email('surya@example'), 'Enter a valid email address');
    });

    test('accepts a valid address', () {
      expect(Validators.email('surya@example.com'), isNull);
    });
  });

  group('Validators.name', () {
    test('requires a value', () {
      expect(Validators.name(''), 'Name is required');
    });

    test('rejects very short names', () {
      expect(Validators.name('A'), 'Name is too short');
    });

    test('accepts a normal name', () {
      expect(Validators.name('Surya Kumar'), isNull);
    });
  });

  group('Validators.password', () {
    test('requires a value', () {
      expect(Validators.password(''), 'Password is required');
    });

    test('enforces a minimum length', () {
      expect(
        Validators.password('12345'),
        'Password must be at least 6 characters',
      );
    });

    test('accepts a long enough password', () {
      expect(Validators.password('secret123'), isNull);
    });
  });

  group('Validators.phone', () {
    test('allows an empty optional value', () {
      expect(Validators.phone(''), isNull);
    });

    test('rejects an invalid number', () {
      expect(Validators.phone('abc'), isNotNull);
    });

    test('accepts a formatted number', () {
      expect(Validators.phone('+1 555 0100'), isNull);
    });
  });

  group('Validators.bio', () {
    test('allows an empty optional value', () {
      expect(Validators.bio(''), isNull);
    });

    test('enforces a maximum length', () {
      expect(Validators.bio('a' * 161), 'Bio must be 160 characters or fewer');
    });
  });
}
