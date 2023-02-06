import 'package:equatable/equatable.dart';
import 'package:sportify/models/exercise.dart';
import 'package:sportify/models/exercise_rep.dart';

class ExerciseTemplate extends Equatable {
  final String _exerciseId;
  final bool _isCustom;
  final List<ExerciseRep> _reps;
  final int _restSec;

  const ExerciseTemplate(
      {required String exerciseId,
      required bool isCustom,
      required int restSec,
      required List<ExerciseRep> reps})
      : _exerciseId = exerciseId,
        _isCustom = isCustom,
        _restSec = restSec,
        _reps = reps;

  ExerciseTemplate.fromExercise({required Exercise exercise})
      : _exerciseId = exercise.name,
        _isCustom = true,
        _reps = [],
        _restSec = 0;

  String get exerciseId => _exerciseId;
  bool get isCustom => _isCustom;
  List<ExerciseRep> get reps => _reps;
  int get restSec => _restSec;

  Map<String, dynamic> toMap() {
    return {
      'exerciseId': _exerciseId,
      'isCustom': _isCustom,
      'restSec': _restSec,
      'reps': _reps.toString(),
    };
  }

  @override
  String toString() {
    return toMap().toString();
  }

  @override
  List<Object> get props => [_exerciseId, _isCustom, _restSec, _reps];
}
