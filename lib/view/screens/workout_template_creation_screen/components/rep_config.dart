import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../cubits/exercise_template/exercise_template_cubit.dart';

class RepConfig extends StatelessWidget {
  const RepConfig({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: BlocBuilder<ExerciseTemplateCubit, ExerciseTemplateState>(
            builder: (ctx, state) => ListView.builder(
              itemCount: state.templates.length,
              itemBuilder: (context, index) =>
                  Text(state.templates[index].exerciseId),
            ),
          ),
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
