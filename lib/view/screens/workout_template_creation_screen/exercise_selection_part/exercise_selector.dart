import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportify/cubits/exercise/exercise_cubit.dart';
import 'package:sportify/cubits/exercise_template/exercise_template_cubit.dart';
import 'package:sportify/models/exercise_template.dart';

import '../../exercise_screen/components/exercises_list_view.dart';

class ExerciseSelector extends StatelessWidget {
  const ExerciseSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: BlocBuilder<ExerciseTemplateCubit, ExerciseTemplateState>(
          builder: (context, state) {
            if (!state.showSelected) {
              return BlocBuilder<ExerciseCubit, ExerciseState>(
                builder: (ctx, exState) {
                  if (exState is ExerciseLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  final selectedExercises =
                      state.templates.map((e) => e.exercise).toList();
                  final exercises =
                      (exState as ExerciseBySearchState).exercises;

                  return ListView.separated(
                    itemCount: exercises.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 5.0),
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () => context
                          .read<ExerciseTemplateCubit>()
                          .addExerciseTemplate(ExerciseTemplate.fromExercise(
                              exercise: exercises[index])),
                      child: ExerciseItem(
                        name: exercises[index].name,
                        groups: exercises[index].pGroups,
                        kcal: exercises[index].kcal,
                        isSelected:
                            selectedExercises.contains(exercises[index]),
                      ),
                    ),
                  );
                },
              );
            }
            return ListView.separated(
              itemCount: state.templates.length,
              separatorBuilder: (context, index) => const SizedBox(height: 5.0),
              itemBuilder: (context, index) => ExerciseItem(
                name: state.templates[index].exercise.name,
                groups: state.templates[index].exercise.pGroups,
                kcal: state.templates[index].exercise.kcal,
              ),
            );
          },
        ),
      ),
    );
  }
}
