part of 'exercise_template_cubit.dart';

class ExerciseTemplateState extends Equatable {
  final String name;
  final int stepNumber;
  final List<ExerciseTemplate> templates;
  final bool showSelected;
  final OperationStatus status;

  ExerciseTemplateState.initial()
      : name = '',
        stepNumber = 0,
        templates = [],
        showSelected = false,
        status = OperationStatus.initial;

  const ExerciseTemplateState(
      {required this.name,
      required this.stepNumber,
      required this.templates,
      required this.showSelected,
      required this.status});

  ExerciseTemplateState copyWith({
    String? name,
    int? stepNumber,
    List<ExerciseTemplate>? templates,
    bool? showSelected,
    OperationStatus? status,
  }) {
    return ExerciseTemplateState(
        name: name ?? this.name,
        stepNumber: stepNumber ?? this.stepNumber,
        templates: templates ?? this.templates,
        showSelected: showSelected ?? this.showSelected,
        status: status ?? this.status);
  }

  @override
  List<Object> get props => [name, templates, stepNumber, showSelected, status];
}
