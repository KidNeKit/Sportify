import 'package:cloud_firestore/cloud_firestore.dart';

class Exercise {
  final String _name;

  const Exercise({required String name}) : _name = name;

  String get name {
    return _name;
  }

  Map<String, dynamic> toMap() {
    return {'name': _name};
  }

  static Exercise fromFirestore(DocumentSnapshot snapshot) {
    return Exercise(name: snapshot['name']);
  }

  @override
  String toString() {
    return toMap().toString();
  }
}
