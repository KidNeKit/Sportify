part of 'exercise_bloc.dart';

abstract class ExerciseEvent extends Equatable {
  const ExerciseEvent();

  @override
  List<Object> get props => [];
}

class GetAllExercises extends ExerciseEvent {}

class GetCustomExercises extends ExerciseEvent {}

class GetBookmarkedExercises extends ExerciseEvent {}

class GetBySearch extends ExerciseEvent {
  final String search;

  const GetBySearch(this.search);

  @override
  List<Object> get props => [search];
}
