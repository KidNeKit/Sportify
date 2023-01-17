import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../blocs/exercise/exercise_bloc.dart';

class ExercisesListView extends StatelessWidget {
  const ExercisesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: BlocBuilder<ExerciseBloc, ExerciseState>(
          builder: (ctx, state) {
            if (state.status == OperationStatus.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state.exercises.isEmpty) {
              return Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: const Center(
                  child: Text('There is no exercises'),
                ),
              );
            }
            if (state.filter == ExerciseFilter.custom) {
              return Text('It is custom: ${state.exercises}');
            }
            return ListView.builder(
              itemCount: state.exercises.length,
              itemBuilder: (ctx, index) =>
                  ExerciseItem(name: state.exercises[index].name),
            );
          },
        ),
      ),
    );
  }
}

class ExerciseItem extends StatelessWidget {
  final String name;
  const ExerciseItem({required this.name, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(),
      ),
      child: Text(name),
    );
  }
}
