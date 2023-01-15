import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sportify/models/exercise.dart';
import 'package:sportify/repositories/exercise_repository.dart';

part 'exercise_creation_state.dart';

class ExerciseCreationCubit extends Cubit<ExerciseCreationState> {
  final ExerciseRepository _exerciseRepository;

  ExerciseCreationCubit({required ExerciseRepository exerciseRepository})
      : _exerciseRepository = exerciseRepository,
        super(const ExerciseCreationState.initial());

  void nameChanged(String name) {
    emit(state.copyWith(name: name));
  }

  void createExercise() {
    log('creating exercise: $state');
    emit(state.copyWith(status: CreationStatus.loading));
    _exerciseRepository.createExercise(Exercise(name: state.name));
    emit(state.copyWith(status: CreationStatus.success));
    try {} catch (_) {}
  }
}
