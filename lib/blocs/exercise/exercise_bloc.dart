import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sportify/repositories/exercise_repository.dart';

import '../../models/exercise.dart';

part 'exercise_event.dart';
part 'exercise_state.dart';

class ExerciseBloc extends Bloc<ExerciseEvent, ExerciseState> {
  final ExerciseRepository _exerciseRepository;

  List<Exercise> _defaultExercises = [];
  List<Exercise> _customExercises = [];
  List<Exercise> _bookmarkedExercises = [];
  bool _isAllInitialized = false;
  bool _isCustomInitialized = false;
  bool _isBookmarkedInitialized = false;

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

    if (_isAllInitialized) {
      emit(state.copyWith(
          status: OperationStatus.successful,
          filter: ExerciseFilter.all,
          exercises: _defaultExercises));
    } else {
      emit(state.copyWith(
          status: OperationStatus.loading, filter: ExerciseFilter.all));
      List<Exercise> exercises = await _exerciseRepository.fetchExercises();
      emit(state.copyWith(
          status: OperationStatus.successful, exercises: exercises));
      _isAllInitialized = true;
      _defaultExercises = exercises;
    }
  }

  void _getBookmarkedExercises(
      GetBookmarkedExercises event, Emitter<ExerciseState> emit) async {
    log('get bookmarked event');

    if (_isBookmarkedInitialized) {
      emit(state.copyWith(
          status: OperationStatus.successful,
          filter: ExerciseFilter.bookmarks,
          exercises: _bookmarkedExercises));
    } else {
      emit(state.copyWith(
          status: OperationStatus.loading, filter: ExerciseFilter.bookmarks));
      List<Exercise> exercises =
          await _exerciseRepository.fetchBookmarkedExercises();
      emit(state.copyWith(
          status: OperationStatus.successful, exercises: exercises));
      _isBookmarkedInitialized = true;
      _bookmarkedExercises = exercises;
    }
  }

  void _getCustomExercises(
      GetCustomExercises event, Emitter<ExerciseState> emit) async {
    log('get custom event');

    if (_isCustomInitialized) {
      emit(state.copyWith(
          status: OperationStatus.successful,
          filter: ExerciseFilter.custom,
          exercises: _customExercises));
    } else {
      emit(state.copyWith(
          status: OperationStatus.loading, filter: ExerciseFilter.custom));
      List<Exercise> exercises =
          await _exerciseRepository.fetchCustomExercises();
      emit(state.copyWith(
          status: OperationStatus.successful, exercises: exercises));
      _isCustomInitialized = true;
      _customExercises = exercises;
    }
  }
}
