import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/exercise/exercise_bloc.dart';

class ExercisesListView extends StatelessWidget {
  const ExercisesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: BlocBuilder<ExerciseBloc, ExerciseState>(
          //buildWhen: (previous, current) => previous.status != current.status,
          builder: (ctx, state) {
            if (state.status == ExerciseStatus.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state.status == ExerciseStatus.custom) {
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
