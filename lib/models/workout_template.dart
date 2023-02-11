import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:sportify/models/exercise.dart';
import 'package:sportify/models/exercise_rep.dart';

import 'exercise_template.dart';

class WorkoutTemplate extends Equatable {
  String name;
  List<ExerciseTemplate> templates;

  WorkoutTemplate({required this.name, required this.templates});

  static WorkoutTemplate fromFirestore(DocumentSnapshot snapshot) {
    List<ExerciseTemplate> exercises = (snapshot['exercises'] as List)
        .map((e) => ExerciseTemplate(
              exercise: Exercise.fromMap(e['exercise']),
              isCustom: e['isCustom'],
              restSec: e['restSec'],
              afterExeriseRestSec: e['afterExeriseRestSec'],
              reps: (e['reps'] as List).map((e) => ExerciseRep()).toList(),
            ))
        .toList();
    return WorkoutTemplate(name: snapshot['name'], templates: exercises);
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'exercises': templates.map((e) => e.toMap()).toList(),
    };
  }

  @override
  List<Object?> get props => [name, templates];
}
