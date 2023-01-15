part of 'exercise_creation_cubit.dart';

enum CreationStatus { initial, loading, success, error }

class ExerciseCreationState extends Equatable {
  final String name;
  final CreationStatus status;

  const ExerciseCreationState.initial()
      : name = '',
        status = CreationStatus.initial;

  const ExerciseCreationState({required this.name, required this.status});

  ExerciseCreationState copyWith({String? name, CreationStatus? status}) {
    return ExerciseCreationState(
        name: name ?? this.name, status: status ?? this.status);
  }

  @override
  List<Object> get props => [name, status];
}
