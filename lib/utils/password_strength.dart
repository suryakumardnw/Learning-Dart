/// Scores password strength for the registration form.
class PasswordStrength {
  PasswordStrength._();

  static final _specialChars = RegExp(r'[!@#$%^&*(),.?":{}|<>]');

  /// Returns a score from 0 (weakest) to 4 (strongest).
  static int score(String password) {
    var score = 0;
    if (password.length >= 8) score++;
    if (password.contains(RegExp(r'[A-Z]'))) score++;
    if (password.contains(RegExp(r'[0-9]'))) score++;
    if (password.contains(_specialChars)) score++;
    return score;
  }

  /// Whether the password is strong enough to accept.
  static bool isStrong(String password) {
    final s = score(password);
    return password.length >= 8 || s >= 3;
  }
}
