import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sportify/models/enums/operation_status.dart';
import 'package:sportify/models/workout_template.dart';
import 'package:sportify/repositories/workout_template_repository.dart';

part 'workout_template_state.dart';

class WorkoutTemplateCubit extends Cubit<WorkoutTemplateState> {
  final WorkoutTemplateRepository _templateRepository;

  StreamSubscription? _workoutsSubscription;
  List<WorkoutTemplate>? _templates;

  WorkoutTemplateCubit({required WorkoutTemplateRepository templateRepository})
      : _templateRepository = templateRepository,
        super(WorkoutTemplateState.initial()) {
    _workoutsSubscription = _templateRepository.workoutTemplates.listen((snap) {
      _templates = _templates ?? [];
      snap.docChanges
          .map((element) => WorkoutTemplate.fromFirestore(element.doc))
          .forEach((element) => _templates!.add(element));
      getWorkoutTemplates();
    });
  }

  void getWorkoutTemplates() async {
    log('get workout templates');

    if (_templates == null) {
      emit(state.copyWith(status: OperationStatus.loading));
      return;
    }
    emit(state.copyWith(
        templates: _templates, status: OperationStatus.successful));
  }

  @override
  Future<void> close() {
    _workoutsSubscription!.cancel();
    return super.close();
  }
}
