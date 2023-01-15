import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/exercise.dart';

class ExerciseRepository {
  final String _userId;
  final FirebaseFirestore _firestore;

  List<Exercise> _exercises = [];

  static const String exercisePath = 'exercises';

  ExerciseRepository({required String userId, FirebaseFirestore? firestore})
      : _userId = userId,
        _firestore = firestore ?? FirebaseFirestore.instance;

  List<Exercise> get exercises {
    return [..._exercises];
  }

  Future<List<Exercise>> fetchExercises() async {
    log('userId: $_userId');
    QuerySnapshot query = await _firestore.collection(exercisePath).get();

    List<Exercise> exerciseList =
        query.docs.map((doc) => Exercise.fromFirestore(doc)).toList();
    log(exerciseList.toString());

    return exerciseList;
  }
}
