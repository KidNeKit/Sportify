import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/exercise.dart';

class ExerciseRepository {
  final FirebaseFirestore _firestore;
  String? _userId;

  static const String exercisePath = 'exercises';

  ExerciseRepository({FirebaseFirestore? firestore})
      : _userId = null,
        _firestore = firestore ?? FirebaseFirestore.instance;

  set setUserId(String id) => _userId = id;

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
