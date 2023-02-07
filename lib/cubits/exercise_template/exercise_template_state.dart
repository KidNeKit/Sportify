part of 'exercise_template_cubit.dart';

class ExerciseTemplateState extends Equatable {
  final int stepNumber;
  final List<ExerciseTemplate> templates;

  ExerciseTemplateState.initial()
      : stepNumber = 0,
        templates = [];

  const ExerciseTemplateState(
      {required this.stepNumber, required this.templates});

  ExerciseTemplateState copyWith(
      {int? stepNumber, List<ExerciseTemplate>? templates}) {
    return ExerciseTemplateState(
        stepNumber: stepNumber ?? this.stepNumber,
        templates: templates ?? this.templates);
  }

  @override
  List<Object> get props => [templates, stepNumber];
}
