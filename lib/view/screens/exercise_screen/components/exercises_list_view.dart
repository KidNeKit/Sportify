import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportify/models/enums/muscle_groups.dart';

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
            return ListView.separated(
              itemCount: state.exercises.length,
              itemBuilder: (ctx, index) => ExerciseItem(
                name: state.exercises[index].name,
                groups: state.exercises[index].pGroups,
              ),
              separatorBuilder: (context, index) =>
                  const SizedBox(height: 10.0),
            );
          },
        ),
      ),
    );
  }
}

class ExerciseItem extends StatelessWidget {
  final String name;
  final List<MuscleGroups> groups;
  const ExerciseItem({required this.name, required this.groups, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(),
        image: DecorationImage(
          image: const NetworkImage(
              'https://blog.nasm.org/hubfs/power-pushups.jpg'),
          fit: BoxFit.cover,
          colorFilter:
              ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.darken),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Text(
              name,
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(color: Colors.white),
            ),
          ),
          LayoutBuilder(
            builder: (ctx, constraints) => ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Column(
                children: [
                  ...groups
                      .map((group) => Container(
                            height: constraints.maxHeight / groups.length,
                            width: 4.0,
                            color: group.color,
                          ))
                      .toList(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
