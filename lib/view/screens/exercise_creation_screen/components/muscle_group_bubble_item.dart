import 'package:flutter/material.dart';

import '../../../../models/enums/muscle_groups.dart';

class MuscleGroupBubbleItem extends StatelessWidget {
  final MuscleGroups group;

  const MuscleGroupBubbleItem({required this.group, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      decoration: BoxDecoration(
        color: group.color,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Center(
        child: Text(
          group.name,
          style: Theme.of(context)
              .textTheme
              .labelMedium!
              .copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
