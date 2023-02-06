part of 'exercise_template_cubit.dart';

class ExerciseTemplateState extends Equatable {
  final List<ExerciseTemplate> templates;

  const ExerciseTemplateState({required this.templates});

  ExerciseTemplateState copyWith({List<ExerciseTemplate>? templates}) {
    return ExerciseTemplateState(templates: templates ?? this.templates);
  }

  @override
  List<Object> get props => [templates];
}
