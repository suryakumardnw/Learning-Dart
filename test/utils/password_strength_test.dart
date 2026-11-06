import 'package:flutter_test/flutter_test.dart';

import 'package:surya_learning_dart/utils/password_strength.dart';

void main() {
  group('PasswordStrength.score', () {
    test('scores an empty password 0', () {
      expect(PasswordStrength.score(''), 0);
    });

    test('scores a strong password 4', () {
      expect(PasswordStrength.score('Str0ng!Pass'), 4);
    });
  });

  group('PasswordStrength.isStrong', () {
    test('rejects short passwords', () {
      expect(PasswordStrength.isStrong('aB1!'), isFalse);
    });

    test('accepts a long varied password', () {
      expect(PasswordStrength.isStrong('Str0ng!Pass'), isTrue);
    });
  });
}
