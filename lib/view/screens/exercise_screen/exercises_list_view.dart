import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/exercise/exercise_bloc.dart';

class ExercisesListView extends StatelessWidget {
  const ExercisesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: BlocBuilder<ExerciseBloc, ExerciseState>(
          buildWhen: (previous, current) => previous.status != current.status,
          builder: (ctx, state) {
            if (state.status == ExerciseStatus.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            log('state: $state');
            return ListView.builder(
              itemCount: state.exercises.length,
              itemBuilder: (ctx, index) =>
                  Text('Exercise ${state.exercises[index].name}'),
            );
          },
        ),
      ),
    );
  }
}
