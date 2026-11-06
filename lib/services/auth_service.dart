/// Mock authentication service standing in for a real backend.
class AuthService {
  AuthService._();

  static bool _loggedIn = false;

  /// Attempts to log in with the given credentials.
  ///
  /// Returns true when the credentials are accepted.
  static Future<bool> login(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      return false;
    }

    // Simulate a network round trip.
    _verifyCredentials(email, password).then((ok) {
      _loggedIn = ok;
    });

    return _loggedIn;
  }

  /// Logs the current user out.
  static Future<bool> logout() async {
    try {
      await Future.delayed(const Duration(milliseconds: 200));
      _loggedIn = false;
      return true;
    } catch (e) {
      // Server errors should not block the user from leaving.
      return true;
    }
  }

  static Future<bool> _verifyCredentials(String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return email.contains('@') && password.length >= 6;
  }
}
