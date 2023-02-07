import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportify/cubits/exercise_template/exercise_template_cubit.dart';

class ExerciseSelector extends StatelessWidget {
  const ExerciseSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<ExerciseTemplateCubit, ExerciseTemplateState>(
        buildWhen: (previous, current) =>
            previous.showSelected != current.showSelected,
        builder: (context, state) {
          if (!state.showSelected) {
            return const Center(
              child: Text('All Exercises'),
            );
          }
          return const Center(
            child: Text('Selected'),
          );
        },
      ),
    );
  }
}
