import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportify/models/enums/operation_status.dart';
import 'package:sportify/models/workout_template.dart';

import '../../models/exercise_rep.dart';
import '../../models/exercise_template.dart';
import '../../repositories/workout_template_repository.dart';
import '../exercise_creation/exercise_creation_cubit.dart';

part 'exercise_template_state.dart';

class ExerciseTemplateCubit extends Cubit<ExerciseTemplateState> {
  final WorkoutTemplateRepository _templateRepository;
  ExerciseTemplateCubit({required WorkoutTemplateRepository templateRepository})
      : _templateRepository = templateRepository,
        super(ExerciseTemplateState.initial());

  void addExerciseTemplate(ExerciseTemplate exerciseTemplate) {
    int index = state.templates
        .indexWhere((element) => element.exercise == exerciseTemplate.exercise);

    if (index != -1) {
      emit(state.copyWith(templates: [...state.templates]..removeAt(index)));
      return;
    }
    emit(state.copyWith(templates: [...state.templates, exerciseTemplate]));
  }

  void removeExerciseTemplate(ExerciseTemplate exerciseTemplate) {}

  void nextStep() {
    emit(state.copyWith(stepNumber: state.stepNumber + 1));
  }

  void prevStep() {
    emit(state.copyWith(stepNumber: state.stepNumber - 1));
  }

  void switchSelectorOption() {
    emit(state.copyWith(showSelected: !state.showSelected));
  }

  void addRepToTemplate(ExerciseTemplate template) {
    log(state.templates.toString());

    int index = state.templates
        .indexWhere((element) => element.exerciseId == template.exerciseId);

    ExerciseTemplate sourceTemplate = state.templates[index];
    ExerciseTemplate copy =
        ExerciseTemplate.clone(exerciseTemplate: sourceTemplate);
    copy = copy.copyWith(reps: [...copy.reps, ExerciseRep()]);

    List<ExerciseTemplate> newList = [...state.templates];
    newList[index] = copy;

    emit(state.copyWith(templates: newList));
  }

  void changeTemplateRestTime(ExerciseTemplate template, String value) {
    int index = state.templates
        .indexWhere((element) => element.exerciseId == template.exerciseId);
    state.templates[index] =
        state.templates[index].copyWith(restSec: int.tryParse(value));
  }

  void changeRestTimeAfterExercise(ExerciseTemplate template, String value) {
    int index = state.templates
        .indexWhere((element) => element.exerciseId == template.exerciseId);
    state.templates[index] = state.templates[index]
        .copyWith(afterExeriseRestSec: int.tryParse(value));
  }

  void expandExercise(String exerciseId) {
    List<ExerciseTemplate> templates = [...state.templates];
    ExerciseTemplate template = templates
        .map((e) => ExerciseTemplate.clone(exerciseTemplate: e))
        .firstWhere((element) => element.exerciseId == exerciseId)
      ..changeExpandValue();

    int index =
        templates.indexWhere((element) => element.exerciseId == exerciseId);
    templates[index] = template;

    emit(state.copyWith(templates: templates));
  }

  void changeWorkoutName(String value) {
    emit(state.copyWith(name: value));
  }

  void createWorkout() {
    log(state.toString());

    emit(state.copyWith(status: OperationStatus.loading));
    WorkoutTemplate template =
        WorkoutTemplate(name: state.name, templates: state.templates);
    _templateRepository
        .createWorkout(template)
        .then(
            (value) => emit(state.copyWith(status: OperationStatus.successful)))
        .catchError(
            (err) => emit(state.copyWith(status: OperationStatus.failed)));
  }
}
