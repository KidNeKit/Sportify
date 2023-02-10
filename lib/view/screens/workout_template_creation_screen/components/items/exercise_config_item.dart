import 'dart:developer';

import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportify/cubits/exercise_template/exercise_template_cubit.dart';
import 'package:sportify/view/screens/workout_template_creation_screen/components/items/rep_item.dart';

import '../../../../../models/exercise_template.dart';

class ExerciseConfigItem extends StatelessWidget {
  final ExerciseTemplate _template;
  final GlobalKey<ExpansionTileCardState> cardKey = GlobalKey();

  ExerciseConfigItem({required ExerciseTemplate template, super.key})
      : _template = template;

  @override
  Widget build(BuildContext context) {
    return ExpansionTileCard(
      key: cardKey,
      title: SizedBox(
        height: 100.0,
        child: Text(_template.exerciseId),
      ),
      baseColor: Colors.purple,
      expandedColor: Colors.amber,
      leading: const CircleAvatar(
        backgroundImage: NetworkImage(
          'https://blog.nasm.org/hubfs/power-pushups.jpg',
        ),
      ),
      children: [
        const Divider(
          thickness: 1.0,
          height: 1.0,
        ),
        TextButton(
          onPressed: () {},
          child: const Text('Add Repetition'),
        ),
      ],
    );
  }
}
