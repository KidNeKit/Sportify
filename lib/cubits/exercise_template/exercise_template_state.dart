part of 'exercise_template_cubit.dart';

class ExerciseTemplateState extends Equatable {
  final int stepNumber;
  final List<ExerciseTemplate> templates;
  final bool showSelected;

  ExerciseTemplateState.initial()
      : stepNumber = 0,
        templates = [],
        showSelected = false;

  const ExerciseTemplateState(
      {required this.stepNumber,
      required this.templates,
      required this.showSelected});

  ExerciseTemplateState copyWith(
      {int? stepNumber,
      List<ExerciseTemplate>? templates,
      bool? showSelected}) {
    return ExerciseTemplateState(
        stepNumber: stepNumber ?? this.stepNumber,
        templates: templates ?? this.templates,
        showSelected: showSelected ?? this.showSelected);
  }

  @override
  List<Object> get props => [templates, stepNumber, showSelected];
}
