import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../cubits/exercise_template/exercise_template_cubit.dart';
import '../../../../../models/exercise_template.dart';

class ExerciseConfigItem extends StatelessWidget {
  final GlobalKey<ExpansionTileCardState> cardKey = GlobalKey();
  ExerciseTemplate _template;

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
        BlocBuilder<ExerciseTemplateCubit, ExerciseTemplateState>(
          builder: (context, state) {
            _template = state.templates
                .where((element) => element.exerciseId == _template.exerciseId)
                .first;
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ...List.generate(
                  _template.reps.length,
                  (index) => Text('Rep №$index'),
                )
              ],
            );
          },
        ),
        TextButton(
          onPressed: () {
            context.read<ExerciseTemplateCubit>().addRepToTemplate(_template);
          },
          child: const Text('Add Repetition'),
        ),
      ],
    );
  }
}
