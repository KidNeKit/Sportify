import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportify/view/screens/exercise_creation_screen/exercise_creation_screen.dart';

import '../../../../cubits/exercise_template/exercise_template_cubit.dart';
import '../../../../models/exercise_template.dart';
import '../../exercise_screen/components/exercises_list_view.dart';

class ExerciseSelection extends StatelessWidget {
  const ExerciseSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Select exercises'),
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
    );
  }
}
