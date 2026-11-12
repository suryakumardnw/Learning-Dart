import 'package:flutter_test/flutter_test.dart';
import 'package:surya_learning_dart/models/app_user.dart';

void main() {
  const user = AppUser(
    id: 'usr-1',
    name: 'Surya Kumar',
    email: 'surya@example.com',
    phone: '+1 555 0100',
    bio: 'Learning Dart.',
    joinedAt: null,
  );

  test('firstName returns the first word of the name', () {
    expect(user.firstName, 'Surya');
  });

  test('initials returns the first letters of the first and last names', () {
    expect(user.initials, 'SK');
  });

  test('initials handles a single-word name', () {
    expect(user.copyWith(name: 'Surya').initials, 'S');
  });

  test('copyWith replaces only the supplied fields', () {
    final updated = user.copyWith(name: 'Surya Dev', phone: '');

    expect(updated.name, 'Surya Dev');
    expect(updated.phone, '');
    expect(updated.email, user.email);
    expect(updated.bio, user.bio);
  });

  test('value equality compares every field', () {
    final same = user.copyWith();
    expect(same, user);
    expect(same.hashCode, user.hashCode);
    expect(user.copyWith(email: 'other@example.com'), isNot(user));
  });
}
