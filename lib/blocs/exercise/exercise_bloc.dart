import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sportify/repositories/exercise_repository.dart';

import '../../models/exercise.dart';

part 'exercise_event.dart';
part 'exercise_state.dart';

class ExerciseBloc extends Bloc<ExerciseEvent, ExerciseState> {
  final ExerciseRepository _exerciseRepository;

  ExerciseBloc({required ExerciseRepository exerciseRepository})
      : _exerciseRepository = exerciseRepository,
        super(ExerciseState.initial()) {
    on<GetAllExercises>(_getAllExercises);
    on<GetBookmarkedExercises>(_getBookmarkedExercises);
    on<GetCustomExercises>(_getCustomExercises);
  }

  void _getAllExercises(
      GetAllExercises event, Emitter<ExerciseState> emit) async {
    log('get all event');

    List<Exercise> exercises = await _exerciseRepository.fetchExercises();
    emit(state.copyWith(status: ExerciseStatus.all, exercises: exercises));
  }

  void _getBookmarkedExercises(
      GetBookmarkedExercises event, Emitter<ExerciseState> emit) {
    log('get bookmarked event');
  }

  void _getCustomExercises(
      GetCustomExercises event, Emitter<ExerciseState> emit) async {
    log('get custom event');
    emit(state.copyWith(status: ExerciseStatus.loading));
    List<Exercise> exercises = await _exerciseRepository.fetchCustomExercises();
    emit(state.copyWith(status: ExerciseStatus.custom, exercises: exercises));
  }
}
