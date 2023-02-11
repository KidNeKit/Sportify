import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sportify/models/exercise_template.dart';
import 'package:sportify/models/workout_template.dart';

class WorkoutTemplateRepository {
  final FirebaseFirestore _firestore;
  String? _userId;

  static const String exercisePath = 'exercises';

  WorkoutTemplateRepository({FirebaseFirestore? firestore})
      : _userId = null,
        _firestore = firestore ?? FirebaseFirestore.instance;

  set setUserId(String id) => _userId = id;

  Future<void> createWorkout(WorkoutTemplate template) async {
    await _firestore
        .collection('users')
        .doc(_userId)
        .collection('workoutTemplates')
        .doc(template.name)
        .set(template.toMap());
  }
}
