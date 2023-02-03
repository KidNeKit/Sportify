import 'package:cloud_firestore/cloud_firestore.dart';

class WorkoutTemplateRepository {
  final FirebaseFirestore _firestore;
  String? _userId;

  static const String exercisePath = 'exercises';

  WorkoutTemplateRepository({FirebaseFirestore? firestore})
      : _userId = null,
        _firestore = firestore ?? FirebaseFirestore.instance;

  set setUserId(String id) => _userId = id;
}
