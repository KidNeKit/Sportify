import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/exercise_creation/exercise_creation_cubit.dart';
import 'components/selected_muscle_group.dart';

class ExerciseCreationScreen extends StatelessWidget {
  static const String routeName = '/exerciseCreation';

  const ExerciseCreationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    log(context.read<ExerciseCreationCubit>().state.toString());
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Create Your Own Exercise',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Excercise name',
                ),
                onChanged: (value) =>
                    context.read<ExerciseCreationCubit>().nameChanged(value),
              ),
              const SizedBox(height: 10),
              Text('Primary muscle groups',
                  style: Theme.of(context).textTheme.labelLarge),
              const SelectedMuscleGroups(),
              Text('Secondary muscle groups',
                  style: Theme.of(context).textTheme.labelLarge),
              Row(
                children: const [
                  Text('Chest'),
                  Text('Press'),
                  Text('Shoulders'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Cancel'),
                  ),
                  BlocBuilder<ExerciseCreationCubit, ExerciseCreationState>(
                    buildWhen: (previous, current) =>
                        previous.status != current.status,
                    builder: (context, state) {
                      if (state.status == CreationStatus.loading) {
                        return const CircularProgressIndicator();
                      }
                      return ElevatedButton(
                        onPressed: () {
                          context
                              .read<ExerciseCreationCubit>()
                              .createExercise();
                          Navigator.of(context).pop();
                        },
                        child: const Text('Create'),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
