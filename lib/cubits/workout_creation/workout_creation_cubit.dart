import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/exercise.dart';

part 'workout_creation_state.dart';

class WorkoutCreationCubit extends Cubit<WorkoutCreationState> {
  WorkoutCreationCubit() : super(WorkoutCreationState.initial());

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
