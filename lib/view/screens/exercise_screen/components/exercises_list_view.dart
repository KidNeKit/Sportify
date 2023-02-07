import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cubits/exercise/exercise_cubit.dart';
import '../../../../models/enums/muscle_groups.dart';

class ExercisesListView extends StatelessWidget {
  final Function _itemTapFunc;

  ExercisesListView({Function? itemTapFunc, super.key})
      : _itemTapFunc = itemTapFunc ??
            ((exercise) {
              log('default tap');
            });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: BlocBuilder<ExerciseCubit, ExerciseState>(
          builder: (ctx, state) {
            if (state is ExerciseLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ExerciseBySearchState) {
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
              return ListView.separated(
                itemCount: state.exercises.length,
                itemBuilder: (ctx, index) => GestureDetector(
                  onTap: () => _itemTapFunc(state.exercises[index]),
                  child: ExerciseItem(
                    name: state.exercises[index].name,
                    groups: state.exercises[index].pGroups,
                    kcal: state.exercises[index].kcal,
                  ),
                ),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10.0),
              );
            } else {
              return Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Center(
                  child: Text(
                      'There is an error during loading exercises: ${(state as ExerciseErrorState).message}'),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

class ExerciseItem extends StatelessWidget {
  final String name;
  final List<MuscleGroups> groups;
  final double? kcal;
  final bool isSelected;
  const ExerciseItem(
      {required this.name,
      required this.groups,
      this.kcal,
      this.isSelected = false,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: isSelected ? 0.7 : 1.0,
      child: Container(
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
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.7), BlendMode.darken),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.yellow,
                  ),
                  child: Text(
                    kcal != null ? '$kcal' : '???',
                    style: Theme.of(context).textTheme.labelSmall!,
                  ),
                ),
                Text(
                  name,
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(color: Colors.white),
                ),
              ],
            ),
            const Spacer(),
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
      ),
    );
  }
}
