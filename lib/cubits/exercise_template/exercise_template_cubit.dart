import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sportify/models/exercise_template.dart';

part 'exercise_template_state.dart';

class ExerciseTemplateCubit extends Cubit<ExerciseTemplateState> {
  ExerciseTemplateCubit() : super(const ExerciseTemplateState(templates: []));

  void addExerciseTemplate(ExerciseTemplate exerciseTemplate) {
    log(state.templates.toString());
    emit(state.copyWith(
        templates: List.from(state.templates)..add(exerciseTemplate)));
  }

  void removeExerciseTemplate(ExerciseTemplate exerciseTemplate) {}
}
