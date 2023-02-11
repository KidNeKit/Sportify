part of 'workout_template_cubit.dart';

class WorkoutTemplateState extends Equatable {
  final List<WorkoutTemplate> templates;
  final OperationStatus status;

  WorkoutTemplateState.initial()
      : templates = [],
        status = OperationStatus.initial;
  const WorkoutTemplateState({required this.templates, required this.status});

  WorkoutTemplateState copyWith(
      {List<WorkoutTemplate>? templates, OperationStatus? status}) {
    return WorkoutTemplateState(
        templates: templates ?? this.templates, status: status ?? this.status);
  }

  @override
  List<Object> get props => [templates, status];
}
