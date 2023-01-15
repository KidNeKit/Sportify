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
    QuerySnapshot query = await _firestore.collection(exercisePath).get();

    List<Exercise> exerciseList =
        query.docs.map((doc) => Exercise.fromFirestore(doc)).toList();

    return exerciseList;
  }

  Future<List<Exercise>> fetchCustomExercises() async {
    QuerySnapshot query = await _firestore
        .collection('users')
        .doc(_userId)
        .collection('customExercises')
        .get();

    List<Exercise> exerciseList =
        query.docs.map((doc) => Exercise.fromFirestore(doc)).toList();

    return exerciseList;
  }

  Future<List<Exercise>> fetchBookmarkedExercises() async {
    QuerySnapshot query = await _firestore
        .collection('users')
        .doc(_userId)
        .collection('bookmarkedExercises')
        .get();
    List<Exercise> exerciseList =
        query.docs.map((doc) => Exercise.fromFirestore(doc)).toList();

    return exerciseList;
  }

  Future<void> createExercise(Exercise exercise) async {
    await _firestore
        .collection('users')
        .doc(_userId)
        .collection('customExercises')
        .doc(exercise.name)
        .set(exercise.toMap());
  }
}
