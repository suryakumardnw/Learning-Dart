/// Shared form-field validators for the auth screens.
class Validators {
  Validators._();

  static final RegExp _emailPattern = RegExp(r'^[\w.+-]+@[\w-]+\.[a-z]{2,4}$');

  /// Validates an email address and returns an error message when invalid.
  static String? email(String? value) {
    final input = value?.trim() ?? '';
    if (input.isEmpty) {
      return 'Email is required';
    }
    if (!_emailPattern.hasMatch(input)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  /// Validates a password and returns an error message when it is too weak.
  static String? password(String? value) {
    final input = value ?? '';
    if (input.isEmpty) {
      return 'Password is required';
    }
    if (input.length < 8) {
      return 'Password must be at least 8 characters';
    }
    if (!input.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain an uppercase letter';
    }
    if (!input.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain a number';
    }
    return null;
  }
}
