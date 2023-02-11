import 'package:equatable/equatable.dart';

import 'exercise_template.dart';

class WorkoutTemplate extends Equatable {
  String name;
  List<ExerciseTemplate> templates;

  WorkoutTemplate({required this.name, required this.templates});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'exercises': templates.map((e) => e.toMap()).toList(),
    };
  }

  @override
  List<Object?> get props => [name, templates];
}
