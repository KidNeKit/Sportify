import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportify/view/screens/workout_template_creation_screen/components/items/rep_item.dart';

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
        height: 60.0,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            _template.exerciseId,
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(color: Colors.white),
          ),
        ),
      ),
      baseColor: Colors.purple,
      expandedColor: Colors.purple.withOpacity(0.5),
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
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ...List.generate(
                    _template.reps.length,
                    (index) => RepItem(
                      rep: _template.reps[index],
                      index: index,
                    ),
                  )
                ],
              ),
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.all(10.0).copyWith(top: 0),
          child: Row(
            children: [
              Text(
                'Rest time',
                style: Theme.of(context).textTheme.labelSmall,
              ),
              const SizedBox(width: 10.0),
              Expanded(
                child:
                    BlocBuilder<ExerciseTemplateCubit, ExerciseTemplateState>(
                  builder: (context, state) {
                    return TextField(
                      decoration: InputDecoration(
                        hintText: state.templates
                            .firstWhere((element) =>
                                element.exerciseId == _template.exerciseId)
                            .restSec
                            .toString(),
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (value) => context
                          .read<ExerciseTemplateCubit>()
                          .changeTemplateRestTime(_template, value),
                    );
                  },
                ),
              ),
              const SizedBox(width: 10.0),
              TextButton(
                onPressed: () {
                  context
                      .read<ExerciseTemplateCubit>()
                      .addRepToTemplate(_template);
                },
                child: Text(
                  'Add Repetition',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
