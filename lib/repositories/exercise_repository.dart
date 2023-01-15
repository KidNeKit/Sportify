import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/exercise.dart';

class ExerciseRepository {
  final FirebaseFirestore _firestore;

  static const String exercisePath = 'exercises';

  ExerciseRepository({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  Future<List<Exercise>> fetchExercises() async {
    QuerySnapshot query = await _firestore.collection(exercisePath).get();

    List<Exercise> exerciseList =
        query.docs.map((doc) => Exercise.fromFirestore(doc)).toList();
    log(exerciseList.toString());

    return exerciseList;
  }
}
