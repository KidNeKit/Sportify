import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/exercise_template/exercise_template_cubit.dart';
import '../auth/auth_background.dart';
import 'components/part_nav_buttons.dart';

class WorkoutCreationFinalScreen extends StatelessWidget {
  const WorkoutCreationFinalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthBackground(
      child: SafeArea(
        child: Column(
          children: [
            Text(
              'Enter workout\'s name',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                onChanged: (value) => context
                    .read<ExerciseTemplateCubit>()
                    .changeWorkoutName(value),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.purple.withOpacity(0.7),
                    ),
                    child: const Center(
                      child: Text('Image'),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.purple),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: const Text('Select workout\'s image preview'),
                  ),
                ],
              ),
            ),
            const Spacer(),
            const PartNavButtonsFinal(),
          ],
        ),
      ),
    );
  }
}
