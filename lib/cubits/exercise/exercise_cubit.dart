import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/enums/exercise_filter.dart';
import '../../models/exercise.dart';
import '../../repositories/exercise_repository.dart';

part 'exercise_state.dart';

class ExerciseCubit extends Cubit<ExerciseState> {
  final ExerciseRepository _exerciseRepository;

  StreamSubscription? _defaultSubscription;
  StreamSubscription? _customSubscription;
  StreamSubscription? _bookmarksSubscription;

  List<Exercise>? _defaultExercises;
  List<Exercise>? _customExercises;
  List<Exercise>? _bookmarkedExercises;

  ExerciseCubit({required ExerciseRepository exerciseRepository})
      : _exerciseRepository = exerciseRepository,
        super(const ExerciseLoadingState(filter: ExerciseFilter.def)) {
    log('created exercise cubit: $_defaultExercises');

    _defaultSubscription = _exerciseRepository.defaultExercises.listen((snap) {
      _defaultExercises = _defaultExercises ?? [];
      snap.docChanges
          .map((element) => Exercise.fromFirestore(element.doc))
          .forEach((element) => _defaultExercises!.add(element));
      getDefaultExercises();
    });

    _customSubscription = _exerciseRepository.customExercises.listen((snap) {
      _customExercises = _customExercises ?? [];
      snap.docChanges
          .map((element) => Exercise.fromFirestore(element.doc))
          .forEach((element) => _customExercises!.add(element));
      getDefaultExercises();
    });

    _bookmarksSubscription =
        _exerciseRepository.bookmarkedExercises.listen((snap) {
      _bookmarkedExercises = _bookmarkedExercises ?? [];
      snap.docChanges
          .map((element) => Exercise.fromFirestore(element.doc))
          .forEach((element) => _bookmarkedExercises!.add(element));
      getDefaultExercises();
    });
  }

  void getAllExercises() async {
    log('get all event');

    emit(const ExerciseLoadingState(filter: ExerciseFilter.all));
    List<Exercise> defExercises = await _exerciseRepository.fetchExercises();
    List<Exercise> customExercises =
        await _exerciseRepository.fetchCustomExercises();
    emit(ExerciseBySearchState(
        search: '',
        exercises: defExercises..addAll(customExercises),
        filter: ExerciseFilter.all));
  }

  void getDefaultExercises() async {
    log('get default event');

    if (_defaultExercises == null) {
      emit(const ExerciseLoadingState(filter: ExerciseFilter.def));
      return;
    }
    emit(ExerciseBySearchState(
        search: '',
        filter: ExerciseFilter.def,
        exercises: _defaultExercises ?? []));
  }

  void getCustomExercises() async {
    log('get custom event');

    if (_customExercises == null) {
      emit(const ExerciseLoadingState(filter: ExerciseFilter.custom));
      return;
    }
    emit(ExerciseBySearchState(
        search: '',
        filter: ExerciseFilter.custom,
        exercises: _customExercises ?? []));
  }

  void getBookmarkedExercises() async {
    log('get bookmarked event');

    if (_bookmarkedExercises == null) {
      emit(const ExerciseLoadingState(filter: ExerciseFilter.bookmarks));
      return;
    }
    emit(ExerciseBySearchState(
        search: '',
        filter: ExerciseFilter.bookmarks,
        exercises: _bookmarkedExercises ?? []));
  }

  void getExercisesBySearch(String value) {
    if (state is ExerciseLoadingState) {
      emit(state);
    } else if (state is ExerciseBySearchState) {
      log('exercise by search');
      ExerciseBySearchState currentState = state as ExerciseBySearchState;
      List<Exercise> foundExercises;
      switch (currentState.filter) {
        case ExerciseFilter.all:
          foundExercises = [..._defaultExercises!, ..._customExercises!];
          break;
        case ExerciseFilter.def:
          foundExercises = [..._defaultExercises!];
          break;
        case ExerciseFilter.custom:
          foundExercises = [..._customExercises!];
          break;
        case ExerciseFilter.bookmarks:
          foundExercises = [..._bookmarkedExercises!];
          break;
      }

      emit(currentState.copyWith(
          exercises: foundExercises
              .where((element) =>
                  element.name.toLowerCase().contains(value.toLowerCase()))
              .toList()));
    }
  }

  @override
  Future<void> close() {
    _defaultSubscription!.cancel();
    _customSubscription!.cancel();
    _bookmarksSubscription!.cancel();
    return super.close();
  }
}
