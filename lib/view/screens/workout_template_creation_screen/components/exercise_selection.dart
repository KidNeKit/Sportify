import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cubits/exercise_template/exercise_template_cubit.dart';
import '../../../../models/exercise_template.dart';
import '../../auth/auth_background.dart';
import '../../exercise_screen/components/exercises_list_view.dart';
import '../exercise_selection_part/option_selector.dart';

class ExerciseSelection extends StatelessWidget {
  const ExerciseSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthBackground(
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Select exercises'),
            const OptionSelector(),
            const TextField(),
            BlocBuilder<ExerciseTemplateCubit, ExerciseTemplateState>(
              builder: (context, state) {
                return ExercisesListView(
                  itemTapFunc: (exercise) {
                    context.read<ExerciseTemplateCubit>().addExerciseTemplate(
                        ExerciseTemplate.fromExercise(exercise: exercise));
                    log('tap in creation: $exercise');
                  },
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Cancel')),
                ElevatedButton(
                    onPressed: () {
                      context.read<ExerciseTemplateCubit>().nextStep();
                    },
                    child: const Text('Continue')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
