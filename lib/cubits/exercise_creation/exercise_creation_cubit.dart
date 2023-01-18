import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/enums/muscle_groups.dart';
import '../../models/exercise.dart';
import '../../repositories/exercise_repository.dart';

part 'exercise_creation_state.dart';

class ExerciseCreationCubit extends Cubit<ExerciseCreationState> {
  final ExerciseRepository _exerciseRepository;

  ExerciseCreationCubit({required ExerciseRepository exerciseRepository})
      : _exerciseRepository = exerciseRepository,
        super(ExerciseCreationState.initial());

  void nameChanged(String name) {
    log(state.toString());
    emit(state.copyWith(name: name));
  }

  void primaryGroupChanged(MuscleGroups group, bool isAdding) {
    List<MuscleGroups> list = [...state.pGroups];
    isAdding ? list.add(group) : list.remove(group);
    emit(state.copyWith(pGroups: list));
  }

  void createExercise() {
    emit(state.copyWith(status: CreationStatus.loading));

    Exercise exercise =
        Exercise(name: state.name, pGroups: state.pGroups, sGroups: []);
    _exerciseRepository.createExercise(exercise);

    emit(state.copyWith(status: CreationStatus.success));
    try {} catch (_) {}
  }
}
