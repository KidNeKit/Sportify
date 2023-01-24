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
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(15.0),
              child: const Center(
                child: TextField(),
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: MuscleGroups.values.length,
                itemBuilder: (ctx, index) =>
                    MuscleGroupItem(group: MuscleGroups.values[index]),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MuscleGroupItem extends StatelessWidget {
  final MuscleGroups group;

  const MuscleGroupItem({required this.group, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SizedBox(
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocBuilder<ExerciseCreationCubit, ExerciseCreationState>(
              builder: (context, state) {
                bool isSelected = state.pGroups.contains(group);
                return GestureDetector(
                  onTap: () => context
                      .read<ExerciseCreationCubit>()
                      .primaryGroupChanged(group, !isSelected),
                  child: Container(
                    height: 20,
                    width: 20,
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
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    group.name,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  const SizedBox(height: 5.0),
                  Container(
                    height: 3.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: group.color,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
