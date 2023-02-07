import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sportify/models/exercise_template.dart';

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
