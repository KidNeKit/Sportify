import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cubits/exercise_creation/exercise_creation_cubit.dart';
import 'muscle_group_bottom_sheet.dart';
import 'muscle_group_bubble_item.dart';

class SelectedMuscleGroups extends StatelessWidget {
  const SelectedMuscleGroups({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            context: context,
            builder: ((context) => const MuscleGroupBottomSheet()));
      },
      child: BlocBuilder<ExerciseCreationCubit, ExerciseCreationState>(
        builder: (context, state) {
          if (state.pGroups.isEmpty) {
            return Container(
              height: 40,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: const Center(
                child: Text('Please select at least one primary muscle group'),
              ),
            );
          }
          return SizedBox(
            height: 40,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: state.pGroups.length,
              itemBuilder: (ctx, index) =>
                  MuscleGroupBubbleItem(group: state.pGroups[index]),
              separatorBuilder: (context, index) => const SizedBox(width: 5.0),
            ),
          );
        },
      ),
    );
  }
}
