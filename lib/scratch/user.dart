class User {
  final String _name;
  late String _mobile;

  User(this._name, this._mobile);

  String get name => _name;

  String get mobile => _mobile;

  set updateMobile(String newMobile) {
    _mobile = newMobile;
  }
}
