part of 'exercise_cubit.dart';

abstract class ExerciseState extends Equatable {
  final ExerciseFilter filter;

  const ExerciseState({required this.filter});

  @override
  List<Object> get props => [filter];
}

class ExerciseBySearchState extends ExerciseState {
  final List<Exercise> exercises;
  final String search;

  const ExerciseBySearchState(
      {required this.search,
      required this.exercises,
      required ExerciseFilter filter})
      : super(filter: filter);

  ExerciseBySearchState copyWith(
      {List<Exercise>? exercises, ExerciseFilter? filter, String? search}) {
    return ExerciseBySearchState(
      exercises: exercises ?? this.exercises,
      filter: filter ?? this.filter,
      search: search ?? this.search,
    );
  }

  @override
  List<Object> get props => [search, filter, exercises];
}

class ExerciseLoadingState extends ExerciseState {
  const ExerciseLoadingState({required ExerciseFilter filter})
      : super(filter: filter);
}

class ExerciseErrorState extends ExerciseState {
  final String message;

  const ExerciseErrorState(
      {required this.message, required ExerciseFilter filter})
      : super(filter: filter);

  @override
  List<Object> get props => [message, filter];
}
