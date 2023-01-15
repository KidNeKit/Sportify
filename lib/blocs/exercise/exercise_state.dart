part of 'exercise_bloc.dart';

enum ExerciseStatus { loading, all, custom, bookmarks }

class ExerciseState extends Equatable {
  final ExerciseStatus status;
  final List<Exercise> exercises;

  ExerciseState.initial()
      : status = ExerciseStatus.loading,
        exercises = [];

  const ExerciseState({required this.exercises, required this.status});

  ExerciseState copyWith({List<Exercise>? exercises, ExerciseStatus? status}) {
    return ExerciseState(
        exercises: exercises ?? this.exercises, status: status ?? this.status);
  }

  @override
  List<Object> get props => [status, exercises];
}
