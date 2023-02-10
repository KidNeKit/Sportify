import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportify/view/screens/workout_template_creation_screen/components/exercise_template_config_screen.dart';

import '../../../cubits/exercise/exercise_cubit.dart';
import '../../../cubits/exercise_template/exercise_template_cubit.dart';
import 'components/exercise_selection.dart';

class WorkoutTemplateCreationScreen extends StatelessWidget {
  static const String routeName = '/workoutTemplateCreation';

  static const List<Widget> _creationSteps = [
    ExerciseSelection(),
    ExerciseTemplateConfigScreen()
  ];

  const WorkoutTemplateCreationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ExerciseCubit>().getAllExercises();
    return BlocProvider(
      create: (context) => ExerciseTemplateCubit(),
      child: BlocBuilder<ExerciseTemplateCubit, ExerciseTemplateState>(
        buildWhen: (previous, current) =>
            previous.stepNumber != current.stepNumber,
        builder: (context, state) {
          return Scaffold(
            body: _creationSteps[state.stepNumber],
          );
        },
      ),
    );
  }
}
