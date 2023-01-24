import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/exercise.dart';
import '../../repositories/exercise_repository.dart';

part 'exercise_event.dart';
part 'exercise_state.dart';

class ExerciseBloc extends Bloc<ExerciseEvent, ExerciseState> {
  final ExerciseRepository _exerciseRepository;

  StreamSubscription? _defaultSubscription;
  StreamSubscription? _customSubscription;
  StreamSubscription? _bookmarksSubscription;

  List<Exercise>? _defaultExercises;
  List<Exercise>? _customExercises;
  List<Exercise>? _bookmarkedExercises;

  ExerciseBloc({required ExerciseRepository exerciseRepository})
      : _exerciseRepository = exerciseRepository,
        super(ExerciseState.initial()) {
    on<GetAllExercises>(_getAllExercises);
    on<GetBookmarkedExercises>(_getBookmarkedExercises);
    on<GetCustomExercises>(_getCustomExercises);
    on<GetBySearch>(_getBySearch);

    _defaultSubscription = _exerciseRepository.defaultExercises.listen((snap) {
      _defaultExercises = _defaultExercises ?? [];
      snap.docChanges
          .map((element) => Exercise.fromFirestore(element.doc))
          .forEach((element) => _defaultExercises!.add(element));
      add(GetAllExercises());
    });

    _customSubscription = _exerciseRepository.customExercises.listen((snap) {
      _customExercises = _customExercises ?? [];
      snap.docChanges
          .map((element) => Exercise.fromFirestore(element.doc))
          .forEach((element) => _customExercises!.add(element));
      add(GetAllExercises());
    });

    _bookmarksSubscription =
        _exerciseRepository.bookmarkedExercises.listen((snap) {
      _bookmarkedExercises = _bookmarkedExercises ?? [];
      snap.docChanges
          .map((element) => Exercise.fromFirestore(element.doc))
          .forEach((element) => _bookmarkedExercises!.add(element));
      add(GetAllExercises());
    });
  }

  void _getAllExercises(
      GetAllExercises event, Emitter<ExerciseState> emit) async {
    log('get all event');

    if (_defaultExercises == null) {
      emit(state.copyWith(
        status: OperationStatus.loading,
        filter: ExerciseFilter.all,
      ));
      return;
    }
    emit(state.copyWith(
      status: OperationStatus.successful,
      filter: ExerciseFilter.all,
      exercises: _defaultExercises,
    ));
  }

  void _getBookmarkedExercises(
      GetBookmarkedExercises event, Emitter<ExerciseState> emit) async {
    log('get bookmarked event');

    if (_bookmarkedExercises == null) {
      emit(state.copyWith(
        status: OperationStatus.loading,
        filter: ExerciseFilter.bookmarks,
      ));
      return;
    }
    emit(state.copyWith(
      status: OperationStatus.successful,
      filter: ExerciseFilter.bookmarks,
      exercises: _bookmarkedExercises,
    ));
  }

  void _getCustomExercises(
      GetCustomExercises event, Emitter<ExerciseState> emit) async {
    log('get custom event');

    if (_customExercises == null) {
      emit(state.copyWith(
        status: OperationStatus.loading,
        filter: ExerciseFilter.custom,
      ));
      return;
    }
    emit(state.copyWith(
      status: OperationStatus.successful,
      filter: ExerciseFilter.custom,
      exercises: _customExercises,
    ));
  }

  void _getBySearch(GetBySearch event, Emitter<ExerciseState> emit) {
    log('searching [${event.search}]...');
    List<Exercise> foundExercises;
    if (state.filter == ExerciseFilter.all) {
      foundExercises = [..._defaultExercises!];
    } else if (state.filter == ExerciseFilter.custom) {
      foundExercises = [..._customExercises!];
    } else {
      foundExercises = [..._bookmarkedExercises!];
    }

    emit(state.copyWith(
      status: OperationStatus.successful,
      exercises: foundExercises
          .where((element) =>
              element.name.toLowerCase().contains(event.search.toLowerCase()))
          .toList(),
    ));
  }

  @override
  Future<void> close() {
    _defaultSubscription!.cancel();
    _customSubscription!.cancel();
    _bookmarksSubscription!.cancel();
    return super.close();
  }
}
