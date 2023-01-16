part of 'exercise_bloc.dart';

enum ExerciseFilter { all, custom, bookmarks }

enum OperationStatus { initial, loading, successful, failed }

class ExerciseState extends Equatable {
  final ExerciseFilter filter;
  final OperationStatus status;
  final List<Exercise> exercises;

  ExerciseState.initial()
      : status = OperationStatus.initial,
        filter = ExerciseFilter.all,
        exercises = [];

  const ExerciseState(
      {required this.exercises, required this.status, required this.filter});

  ExerciseState copyWith(
      {List<Exercise>? exercises,
      OperationStatus? status,
      ExerciseFilter? filter}) {
    return ExerciseState(
      exercises: exercises ?? this.exercises,
      status: status ?? this.status,
      filter: filter ?? this.filter,
    );
  }

  @override
  List<Object> get props => [status, exercises, filter];
}
