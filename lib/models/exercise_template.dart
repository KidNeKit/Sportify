import 'package:equatable/equatable.dart';
import 'package:sportify/models/exercise.dart';
import 'package:sportify/models/exercise_rep.dart';

class ExerciseTemplate extends Equatable {
  final Exercise _exercise;
  final bool _isCustom;
  bool _isExpanded;
  final List<ExerciseRep> _reps;
  final int _restSec;

  ExerciseTemplate(
      {required Exercise exercise,
      required bool isCustom,
      required int restSec,
      required List<ExerciseRep> reps,
      bool isExpanded = false})
      : _exercise = exercise,
        _isCustom = isCustom,
        _isExpanded = isExpanded,
        _restSec = restSec,
        _reps = reps;

  ExerciseTemplate.fromExercise({required Exercise exercise})
      : _exercise = exercise,
        _isCustom = true,
        _isExpanded = false,
        _reps = [],
        _restSec = 0;

  ExerciseTemplate.clone({required ExerciseTemplate exerciseTemplate})
      : _exercise = Exercise.clone(exerciseTemplate._exercise),
        _isCustom = exerciseTemplate._isCustom,
        _isExpanded = exerciseTemplate._isExpanded,
        _reps = exerciseTemplate._reps,
        _restSec = exerciseTemplate._restSec;

  String get exerciseId => _exercise.name;
  Exercise get exercise => _exercise;
  bool get isCustom => _isCustom;
  bool get isExpanded => _isExpanded;
  List<ExerciseRep> get reps => _reps;
  int get restSec => _restSec;

  void changeExpandValue() {
    _isExpanded = !_isExpanded;
  }

  ExerciseTemplate copyWith(
      {Exercise? exercise,
      bool? isCustom,
      int? restSec,
      List<ExerciseRep>? reps}) {
    return ExerciseTemplate(
        exercise: exercise ?? _exercise,
        isCustom: isCustom ?? _isCustom,
        restSec: restSec ?? _restSec,
        reps: reps ?? _reps);
  }

  Map<String, dynamic> toMap() {
    return {
      'exerciseId': _exercise.name,
      'isCustom': _isCustom,
      'isExpanded': _isExpanded,
      'restSec': _restSec,
      'reps': _reps.toString(),
    };
  }

  @override
  String toString() {
    return toMap().toString();
  }

  @override
  List<Object> get props =>
      [_exercise, _isCustom, _restSec, _reps, _isExpanded];
}
