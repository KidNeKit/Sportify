part of 'workout_creation_cubit.dart';

enum CreationStatus { initial, loading, success, error }

class WorkoutCreationState extends Equatable {
  final String name;
  final List<Exercise> exercises;
  final CreationStatus status;

  WorkoutCreationState.initial()
      : name = '',
        exercises = [],
        status = CreationStatus.initial;

  const WorkoutCreationState(
      {required this.name, required this.exercises, required this.status});

  WorkoutCreationState copyWith(
      {String? name, List<Exercise>? exercises, CreationStatus? status}) {
    return WorkoutCreationState(
        name: name ?? this.name,
        exercises: exercises ?? this.exercises,
        status: status ?? this.status);
  }

  @override
  List<Object> get props => [name, exercises, status];
}
