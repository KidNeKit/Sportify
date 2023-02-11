import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sportify/models/exercise.dart';
import 'package:sportify/models/exercise_rep.dart';
import 'package:sportify/models/exercise_template.dart';
import 'package:sportify/view/screens/exercise_creation_screen/exercise_creation_screen.dart';

part 'exercise_template_state.dart';

class ExerciseTemplateCubit extends Cubit<ExerciseTemplateState> {
  ExerciseTemplateCubit() : super(ExerciseTemplateState.initial());

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
    copy = copy.copyWith(reps: [...copy.reps, ExerciseRep(name: 'Skib')]);

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
}
