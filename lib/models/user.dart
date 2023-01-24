class User {
  final String _id;
  final String _email;

  const User({required String id, required String email})
      : _id = id,
        _email = email;

  Map<String, dynamic> toMap() {
    return {
      'id': _id,
      'email': _email,
    };
  }
}
