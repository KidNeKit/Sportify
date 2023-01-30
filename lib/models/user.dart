class User {
  final String? _id;
  final String _email;
  final String _username;
  final double _height;
  final double _weight;

  const User(
      {required String id,
      required String email,
      required String username,
      required double weight,
      required double height})
      : _id = id,
        _email = email,
        _username = username,
        _weight = weight,
        _height = height;

  const User.creation(
      {required String email,
      required String username,
      required double weight,
      required double height})
      : _id = null,
        _email = email,
        _username = username,
        _weight = weight,
        _height = height;

  String? get id => _id;
  String get email => _email;
  String get username => _username;
  double get height => _height;
  double get weight => _weight;

  Map<String, dynamic> toMap() {
    return {
      'id': _id,
      'email': _email,
      'username': _username,
      'height': _height,
      'weight': _weight,
    };
  }
}
