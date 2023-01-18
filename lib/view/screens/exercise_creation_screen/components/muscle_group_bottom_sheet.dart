import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cubits/exercise_creation/exercise_creation_cubit.dart';
import '../../../../models/enums/muscle_groups.dart';

class MuscleGroupBottomSheet extends StatelessWidget {
  const MuscleGroupBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ExerciseCreationCubit>.value(
      value: context.read<ExerciseCreationCubit>(),
      child: Container(
        height: 400,
        width: double.infinity,
        color: Colors.white,
        child: ListView.builder(
            itemCount: MuscleGroups.values.length,
            itemBuilder: (ctx, index) =>
                MuscleGroupItem(group: MuscleGroups.values[index])),
      ),
    );
  }
}

class MuscleGroupItem extends StatelessWidget {
  final MuscleGroups group;

  const MuscleGroupItem({required this.group, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          const SizedBox(width: 10.0),
          BlocBuilder<ExerciseCreationCubit, ExerciseCreationState>(
            builder: (context, state) {
              bool isSelected = state.pGroups.contains(group);
              return GestureDetector(
                onTap: () => context
                    .read<ExerciseCreationCubit>()
                    .primaryGroupChanged(group, !isSelected),
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(),
                    color: isSelected ? Colors.green : Colors.white,
                  ),
                ),
              );
            },
          ),
          const SizedBox(width: 10.0),
          Container(
            height: 40,
            width: 40,
            color: group.color,
          ),
          const SizedBox(width: 10.0),
          Text(
            group.name,
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ],
      ),
    );
  }
}
