/// Form field validators shared across the app.
class Validators {
  const Validators._();

  static final RegExp _emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
  static final RegExp _phoneRegex = RegExp(r'^[+()\d\s-]{7,}$');

  /// Validates an email address, returning an error message or null.
  static String? email(String? value) {
    final input = value?.trim() ?? '';
    if (input.isEmpty) return 'Email is required';
    if (!_emailRegex.hasMatch(input)) return 'Enter a valid email address';
    return null;
  }

  /// Validates a password, returning an error message or null.
  static String? password(String? value) {
    if (value == null || value.isEmpty) return 'Password is required';
    if (value.length < 6) return 'Password must be at least 6 characters';
    return null;
  }

  /// Validates a full name, returning an error message or null.
  static String? name(String? value) {
    final input = value?.trim() ?? '';
    if (input.isEmpty) return 'Name is required';
    if (input.length < 2) return 'Name is too short';
    return null;
  }

  /// Validates an optional phone number, returning an error message or null.
  static String? phone(String? value) {
    final input = value?.trim() ?? '';
    if (input.isEmpty) return null;
    if (!_phoneRegex.hasMatch(input)) return 'Enter a valid phone number';
    return null;
  }

  /// Validates an optional bio, returning an error message or null.
  static String? bio(String? value) {
    final input = value?.trim() ?? '';
    if (input.length > 160) return 'Bio must be 160 characters or fewer';
    return null;
  }
}
