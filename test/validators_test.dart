import 'package:flutter_test/flutter_test.dart';
import 'package:surya_learning_dart/utils/validators.dart';

void main() {
  group('Validators.email', () {
    test('requires a value', () {
      expect(Validators.email(null), isNotNull);
      expect(Validators.email('   '), isNotNull);
    });

    test('rejects malformed addresses', () {
      expect(Validators.email('not-an-email'), isNotNull);
      expect(Validators.email('user@'), isNotNull);
    });

    test('accepts valid addresses', () {
      expect(Validators.email('user@example.com'), isNull);
      expect(Validators.email('  user.name+tag@example.co.uk  '), isNull);
    });
  });

  group('Validators.password', () {
    test('requires a value', () {
      expect(Validators.password(null), isNotNull);
      expect(Validators.password(''), isNotNull);
    });

    test('enforces the minimum length', () {
      expect(Validators.password('Ab1'), isNotNull);
    });

    test('requires mixed case and a digit', () {
      expect(Validators.password('abcdefg1'), isNotNull);
      expect(Validators.password('ABCDEFG1'), isNotNull);
      expect(Validators.password('Abcdefgh'), isNotNull);
    });

    test('accepts a strong password', () {
      expect(Validators.password('Abcdefg1'), isNull);
    });
  });
}
