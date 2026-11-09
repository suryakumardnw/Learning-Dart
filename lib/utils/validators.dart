/// Common form-field validators used by the auth screens.
class Validators {
  Validators._();

  static final RegExp _emailPattern = RegExp(r'^[\w.+-]+@[\w-]+\.[\w.-]+$');

  /// Returns `null` when [value] looks like an email address, otherwise an
  /// error message suitable for [FormFieldValidator].
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

  /// Returns `null` when [value] meets the minimum password requirements,
  /// otherwise an error message suitable for [FormFieldValidator].
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
    if (!input.contains(RegExp(r'[a-z]'))) {
      return 'Password must contain a lowercase letter';
    }
    if (!input.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain a number';
    }
    return null;
  }
}
