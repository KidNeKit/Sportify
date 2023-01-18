part of 'exercise_creation_cubit.dart';

enum CreationStatus { initial, loading, success, error }

class ExerciseCreationState extends Equatable {
  final String name;
  final List<MuscleGroups> pGroups;
  final CreationStatus status;

  ExerciseCreationState.initial()
      : name = '',
        pGroups = [],
        status = CreationStatus.initial;

  const ExerciseCreationState(
      {required this.name, required this.status, required this.pGroups});

  ExerciseCreationState copyWith(
      {String? name, CreationStatus? status, List<MuscleGroups>? pGroups}) {
    return ExerciseCreationState(
        name: name ?? this.name,
        status: status ?? this.status,
        pGroups: pGroups ?? this.pGroups);
  }

  @override
  List<Object> get props => [name, status, pGroups];
}
