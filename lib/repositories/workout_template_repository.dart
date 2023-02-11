import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/workout_template.dart';

class WorkoutTemplateRepository {
  final FirebaseFirestore _firestore;
  String? _userId;

  static const String exercisePath = 'exercises';

  WorkoutTemplateRepository({FirebaseFirestore? firestore})
      : _userId = null,
        _firestore = firestore ?? FirebaseFirestore.instance;

  set setUserId(String id) => _userId = id;

  Stream<QuerySnapshot<Map<String, dynamic>>> get workoutTemplates => _firestore
      .collection('users')
      .doc(_userId)
      .collection('workoutTemplates')
      .snapshots();

  Future<void> createWorkout(WorkoutTemplate template) async {
    await _firestore
        .collection('users')
        .doc(_userId)
        .collection('workoutTemplates')
        .doc(template.name)
        .set(template.toMap());
  }
}
