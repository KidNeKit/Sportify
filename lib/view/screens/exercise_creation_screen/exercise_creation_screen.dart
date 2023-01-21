import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/exercise_creation/exercise_creation_cubit.dart';
import 'components/selected_muscle_group.dart';

class ExerciseCreationScreen extends StatelessWidget {
  static const String routeName = '/exerciseCreation';

  ExerciseMeasure _measure = ExerciseMeasure.quantity;

  ExerciseCreationScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              // Text('Secondary muscle groups',
              //     style: Theme.of(context).textTheme.labelLarge),
              // const SelectedMuscleGroups(),
              Row(
                children: [
                  Text('Enter average ccal/hr',
                      style: Theme.of(context).textTheme.labelLarge),
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      onChanged: (value) => context
                          .read<ExerciseCreationCubit>()
                          .kcalChanged(value),
                    ),
                  ),
                ],
              ),
              Text('Choose exercise measure type',
                  style: Theme.of(context).textTheme.labelLarge),
              BlocBuilder<ExerciseCreationCubit, ExerciseCreationState>(
                buildWhen: (previous, current) =>
                    previous.measure != current.measure,
                builder: (context, state) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: RadioListTile<ExerciseMeasure>(
                          title: const Text('Quantity'),
                          value: ExerciseMeasure.quantity,
                          groupValue: _measure,
                          onChanged: (value) {
                            _measure = ExerciseMeasure.quantity;
                            context
                                .read<ExerciseCreationCubit>()
                                .measureChanged(_measure);
                          },
                        ),
                      ),
                      Expanded(
                        child: RadioListTile<ExerciseMeasure>(
                          title: const Text('Distance'),
                          value: ExerciseMeasure.distance,
                          groupValue: _measure,
                          onChanged: (value) {
                            _measure = ExerciseMeasure.distance;
                            context
                                .read<ExerciseCreationCubit>()
                                .measureChanged(_measure);
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        context.read<ExerciseCreationCubit>().cancel();
                        Navigator.of(context).pop();
                      },
                      child: const Text('Cancel'),
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  BlocConsumer<ExerciseCreationCubit, ExerciseCreationState>(
                    listener: (context, state) {
                      log('listener: ${state.status}');
                      if (state.status == CreationStatus.error) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('There is an error')));
                      }
                      if (state.status == CreationStatus.success) {
                        context.read<ExerciseCreationCubit>().cancel();
                        Navigator.of(context).pop();
                      }
                    },
                    buildWhen: (previous, current) =>
                        previous.status != current.status,
                    builder: (context, state) {
                      if (state.status == CreationStatus.loading) {
                        return const CircularProgressIndicator();
                      }
                      return Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            context
                                .read<ExerciseCreationCubit>()
                                .createExercise();
                          },
                          child: const Text('Create'),
                        ),
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

enum ExerciseMeasure {
  quantity,
  distance;

  @override
  String toString() {
    return name;
  }
}
