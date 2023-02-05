import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportify/cubits/exercise/exercise_cubit.dart';

import '../exercise_screen/components/exercises_list_view.dart';

class WorkoutTemplateCreationScreen extends StatelessWidget {
  static const String routeName = '/workoutTemplateCreation';

  const WorkoutTemplateCreationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ExerciseCubit>().getAllExercises();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Select exercises'),
          const ExercisesListView(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancel')),
              ElevatedButton(onPressed: () {}, child: const Text('Continue')),
            ],
          ),
        ],
      ),
    );
  }
}
