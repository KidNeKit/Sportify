part of 'exercise_bloc.dart';

enum ExerciseFilter { all, custom, bookmarks }

enum OperationStatus { loading, successful, failed }

class ExerciseState extends Equatable {
  final ExerciseFilter filter;
  final OperationStatus status;
  final List<Exercise> exercises;
  final String search;

  ExerciseState.initial()
      : status = OperationStatus.loading,
        filter = ExerciseFilter.all,
        exercises = [],
        search = '';

  const ExerciseState(
      {required this.exercises,
      required this.status,
      required this.filter,
      this.search = ''});

  ExerciseState copyWith(
      {List<Exercise>? exercises,
      OperationStatus? status,
      ExerciseFilter? filter,
      String? search}) {
    return ExerciseState(
      exercises: exercises ?? this.exercises,
      status: status ?? this.status,
      filter: filter ?? this.filter,
      search: search ?? this.search,
    );
  }

  @override
  List<Object> get props => [status, exercises, filter, search];
}
