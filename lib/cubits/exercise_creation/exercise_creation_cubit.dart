import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportify/view/screens/exercise_creation_screen/exercise_creation_screen.dart';

import '../../models/enums/muscle_groups.dart';
import '../../models/exercise.dart';
import '../../repositories/exercise_repository.dart';

part 'exercise_creation_state.dart';

class ExerciseCreationCubit extends Cubit<ExerciseCreationState> {
  final ExerciseRepository _exerciseRepository;

  ExerciseCreationCubit({required ExerciseRepository exerciseRepository})
      : _exerciseRepository = exerciseRepository,
        super(ExerciseCreationState.initial()) {
    log('creation cubit created');
  }

  void nameChanged(String name) {
    emit(state.copyWith(name: name));
  }

  void primaryGroupChanged(MuscleGroups group, bool isAdding) {
    List<MuscleGroups> list = [...state.pGroups];
    isAdding ? list.add(group) : list.remove(group);
    emit(state.copyWith(pGroups: list));
  }

  void kcalChanged(String kcal) {
    emit(state.copyWith(kcal: double.tryParse(kcal)));
  }

  void measureChanged(ExerciseMeasure measure) {
    emit(state.copyWith(measure: measure));
  }

  void cancel() {
    emit(ExerciseCreationState.initial());
  }

  void createExercise() {
    emit(state.copyWith(status: CreationStatus.loading));

    Exercise exercise = Exercise(
        name: state.name,
        measure: state.measure,
        pGroups: state.pGroups,
        sGroups: [],
        kcal: state.kcal);
    _exerciseRepository
        .createExercise(exercise)
        .then((value) => emit(state.copyWith(status: CreationStatus.success)))
        .catchError(
            (err) => emit(state.copyWith(status: CreationStatus.error)));
  }
}
