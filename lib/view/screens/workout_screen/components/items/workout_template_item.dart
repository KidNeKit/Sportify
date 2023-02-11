import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sportify/models/enums/muscle_groups.dart';
import 'package:sportify/models/exercise_template.dart';
import 'package:sportify/models/workout_template.dart';

class WorkoutTemplateItem extends StatelessWidget {
  final WorkoutTemplate template;

  const WorkoutTemplateItem({required this.template, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            template.name,
            style: Theme.of(context).textTheme.labelMedium,
          ),
          const SizedBox(height: 5.0),
          Text(
            '${template.templates.length} exercise${template.templates.length != 1 ? 's' : ''}',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: 5.0),
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: LayoutBuilder(builder: (ctx, constraints) {
              double rowWidth = constraints.maxWidth;
              List<MuscleGroups> groups = template.templates
                  .expand((element) => element.exercise.pGroups)
                  .toList()
                ..sort((a, b) => a.label.compareTo(b.label));
              return Row(
                children: [
                  ...List.generate(
                      groups.length,
                      (index) => Container(
                            height: 5.0,
                            width: rowWidth / groups.length,
                            color: groups.elementAt(index).color,
                          )).toList(),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}
