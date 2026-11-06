/// A simple user model used in the Dart learning exercises.
class User {
  final String _name;
  late String _mobile;

  User(this._name, this._mobile);

  /// Creates a placeholder user without contact details.
  User.anonymous(this._name);

  String get name => _name;

  String get mobile => _mobile;

  set mobile(String newMobile) {
    _mobile = newMobile;
  }

  /// Returns a copy of this user with the given fields replaced.
  User copyWith({String? name, String? mobile}) =>
      User(name ?? _name, mobile ?? _mobile);

  @override
  String toString() => 'User($_name, $_mobile)';
}
