import 'package:equatable/equatable.dart';
import 'package:sportify/models/exercise.dart';
import 'package:sportify/models/exercise_rep.dart';

class ExerciseTemplate extends Equatable {
  final String _exerciseId;
  final bool _isCustom;
  bool _isExpanded;
  final List<ExerciseRep> _reps;
  final int _restSec;

  ExerciseTemplate(
      {required String exerciseId,
      required bool isCustom,
      required int restSec,
      required List<ExerciseRep> reps,
      bool isExpanded = false})
      : _exerciseId = exerciseId,
        _isCustom = isCustom,
        _isExpanded = isExpanded,
        _restSec = restSec,
        _reps = reps;

  ExerciseTemplate.fromExercise({required Exercise exercise})
      : _exerciseId = exercise.name,
        _isCustom = true,
        _isExpanded = false,
        _reps = [],
        _restSec = 0;

  ExerciseTemplate.clone({required ExerciseTemplate exerciseTemplate})
      : _exerciseId = exerciseTemplate._exerciseId,
        _isCustom = exerciseTemplate._isCustom,
        _isExpanded = exerciseTemplate._isExpanded,
        _reps = exerciseTemplate._reps,
        _restSec = exerciseTemplate._restSec;

  String get exerciseId => _exerciseId;
  bool get isCustom => _isCustom;
  bool get isExpanded => _isExpanded;
  List<ExerciseRep> get reps => _reps;
  int get restSec => _restSec;

  void changeExpandValue() {
    _isExpanded = !_isExpanded;
  }

  Map<String, dynamic> toMap() {
    return {
      'exerciseId': _exerciseId,
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
      [_exerciseId, _isCustom, _restSec, _reps, _isExpanded];
}
