import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportify/models/enums/operation_status.dart';
import 'package:sportify/view/screens/workout_template_creation_screen/components/exercise_template_config_screen.dart';
import 'package:sportify/view/screens/workout_template_creation_screen/workout_creation_final_screen.dart';

import '../../../cubits/exercise/exercise_cubit.dart';
import '../../../cubits/exercise_template/exercise_template_cubit.dart';
import '../../../repositories/workout_template_repository.dart';
import 'components/exercise_selection.dart';

class WorkoutTemplateCreationScreen extends StatelessWidget {
  static const String routeName = '/workoutTemplateCreation';

  static const List<Widget> _creationSteps = [
    ExerciseSelection(),
    ExerciseTemplateConfigScreen(),
    WorkoutCreationFinalScreen(),
  ];

  const WorkoutTemplateCreationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ExerciseCubit>().getAllExercises();
    return BlocProvider(
      create: (ctx) => ExerciseTemplateCubit(
          templateRepository: ctx.read<WorkoutTemplateRepository>()),
      child: BlocConsumer<ExerciseTemplateCubit, ExerciseTemplateState>(
        listener: (context, state) {
          if (state.status == OperationStatus.successful) {
            Navigator.of(context).pop();
          } else if (state.status == OperationStatus.failed) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text(
                    'There is an error during workout template creation')));
          }
        },
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
