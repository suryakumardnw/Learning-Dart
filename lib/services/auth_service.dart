import 'package:flutter/foundation.dart';
import 'package:surya_learning_dart/models/app_user.dart';

/// Thrown when the mock authentication flow cannot complete.
@immutable
class AuthException implements Exception {
  const AuthException(this.message);

  final String message;

  @override
  String toString() => message;
}

/// In-memory authentication service used by the demo screens.
///
/// It extends [ChangeNotifier] so profile screens can rebuild when the
/// signed-in user changes.
class AuthService extends ChangeNotifier {
  AuthService({AppUser? seedUser}) : _currentUser = seedUser ?? demoUser;

  static final AppUser demoUser = AppUser(
    id: 'usr-001',
    name: 'Surya Kumar',
    email: 'surya@example.com',
    phone: '+1 555 0100',
    bio: 'Learning Dart one widget at a time.',
    role: 'Flutter Learner',
    joinedAt: DateTime(2025, 1, 15),
  );

  AppUser _currentUser;
  bool _signedIn = false;

  AppUser get currentUser => _currentUser;
  bool get isSignedIn => _signedIn;

  /// Signs in with any non-empty credentials and returns the demo user.
  Future<AppUser> signIn({
    required String email,
    required String password,
  }) async {
    if (email.trim().isEmpty || password.isEmpty) {
      throw const AuthException('Enter your email and password.');
    }

    await Future<void>.delayed(const Duration(milliseconds: 120));
    _currentUser = _currentUser.copyWith(email: email.trim());
    _signedIn = true;
    notifyListeners();
    return _currentUser;
  }

  /// Registers a fresh demo account and signs it in.
  Future<AppUser> register({
    required String name,
    required String email,
    required String password,
  }) async {
    if (name.trim().isEmpty || email.trim().isEmpty || password.isEmpty) {
      throw const AuthException('All fields are required.');
    }

    await Future<void>.delayed(const Duration(milliseconds: 120));
    _currentUser = demoUser.copyWith(
      name: name.trim(),
      email: email.trim(),
      joinedAt: DateTime.now(),
    );
    _signedIn = true;
    notifyListeners();
    return _currentUser;
  }

  /// Applies profile edits to the current user.
  void updateProfile({
    required String name,
    required String email,
    String? phone,
    String? bio,
  }) {
    _currentUser = _currentUser.copyWith(
      name: name.trim(),
      email: email.trim(),
      phone: phone,
      bio: bio,
    );
    notifyListeners();
  }

  /// Signs the user out of the demo session.
  Future<void> signOut() async {
    await Future<void>.delayed(const Duration(milliseconds: 80));
    _signedIn = false;
    notifyListeners();
  }
}

/// App-wide authentication service instance.
final AuthService authService = AuthService();
