import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/exercise.dart';
import '../../repositories/workout_template_repository.dart';

part 'workout_creation_state.dart';

class WorkoutCreationCubit extends Cubit<WorkoutCreationState> {
  final WorkoutTemplateRepository _workoutTemplateRepository;

  WorkoutCreationCubit(
      {required WorkoutTemplateRepository workoutTemplateRepository})
      : _workoutTemplateRepository = workoutTemplateRepository,
        super(WorkoutCreationState.initial()) {
    log('workout template creation cubit created');
  }

  void changeName(String name) {
    emit(state.copyWith(name: name));
  }

  void addExercise(Exercise exercise) {
    emit(state.copyWith(exercises: state.exercises..add(exercise)));
  }

  void removeExercise(Exercise exercise) {
    emit(state.copyWith(exercises: state.exercises..remove(exercise)));
  }
}
