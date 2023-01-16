import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportify/blocs/auth/auth_bloc.dart';
import 'package:sportify/blocs/exercise/exercise_bloc.dart';
import 'package:sportify/cubits/exercise_creation/exercise_creation_cubit.dart';
import 'package:sportify/repositories/exercise_repository.dart';

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
