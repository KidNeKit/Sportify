part of 'exercise_creation_cubit.dart';

enum CreationStatus { initial, loading, success, error }

class ExerciseCreationState extends Equatable {
  final String name;
  final double? kcal;
  final ExerciseMeasure measure;
  final List<MuscleGroups> pGroups;
  final CreationStatus status;

  ExerciseCreationState.initial()
      : name = '',
        pGroups = [],
        status = CreationStatus.initial,
        kcal = null,
        measure = ExerciseMeasure.quantity;

  const ExerciseCreationState(
      {required this.name,
      required this.measure,
      required this.status,
      required this.pGroups,
      this.kcal});

  ExerciseCreationState copyWith(
      {String? name,
      ExerciseMeasure? measure,
      CreationStatus? status,
      List<MuscleGroups>? pGroups,
      double? kcal}) {
    return ExerciseCreationState(
        name: name ?? this.name,
        measure: measure ?? this.measure,
        status: status ?? this.status,
        pGroups: pGroups ?? this.pGroups,
        kcal: kcal ?? this.kcal);
  }

  @override
  List<Object?> get props => [name, status, pGroups, kcal, measure];
}
