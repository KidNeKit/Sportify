import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportify/view/screens/workout_template_creation_screen/components/items/exercise_config_item.dart';
import '../../../../cubits/exercise_template/exercise_template_cubit.dart';

class RepConfig extends StatelessWidget {
  const RepConfig({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: BlocBuilder<ExerciseTemplateCubit, ExerciseTemplateState>(
              buildWhen: (previous, current) =>
                  previous.templates != current.templates,
              builder: (ctx, state) {
                return ListView.builder(
                  itemCount: state.templates.length,
                  itemBuilder: (context, index) => ExerciseConfigItem(
                    exerciseName: state.templates[index].exerciseId,
                    isExpanded: state.templates[index].isExpanded,
                    index: index,
                  ),
                );
              }),
        ),
        ElevatedButton(
            onPressed: () {
              context.read<ExerciseTemplateCubit>().prevStep();
            },
            child: const Text('Go Back')),
      ],
    );
  }
}
