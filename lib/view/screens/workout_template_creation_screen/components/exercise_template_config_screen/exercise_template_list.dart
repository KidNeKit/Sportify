import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../cubits/exercise_template/exercise_template_cubit.dart';
import '../../../../../models/exercise_template.dart';
import '../items/exercise_config_item.dart';

class ExerciseTemplateList extends StatelessWidget {
  const ExerciseTemplateList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: BlocBuilder<ExerciseTemplateCubit, ExerciseTemplateState>(
            buildWhen: (previous, current) =>
                previous.stepNumber != current.stepNumber,
            builder: (ctx, state) {
              return ListView.separated(
                itemCount: state.templates.length,
                separatorBuilder: (context, index) =>
                    RestSeparatorContainer(template: state.templates[index]),
                itemBuilder: (context, index) => ExerciseConfigItem(
                  template: state.templates[index],
                ),
              );
            }),
      ),
    );
  }
}

class RestSeparatorContainer extends StatelessWidget {
  final ExerciseTemplate _template;
  const RestSeparatorContainer({required ExerciseTemplate template, super.key})
      : _template = template;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        height: 50.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            children: [
              const Text('Rest Time'),
              const SizedBox(width: 30.0),
              Expanded(
                child:
                    BlocBuilder<ExerciseTemplateCubit, ExerciseTemplateState>(
                  builder: (context, state) {
                    return TextField(
                      decoration: InputDecoration(
                        hintText: state.templates
                            .firstWhere((element) =>
                                element.exerciseId == _template.exerciseId)
                            .afterExeriseRestSec
                            .toString(),
                      ),
                      onChanged: (value) => context
                          .read<ExerciseTemplateCubit>()
                          .changeRestTimeAfterExercise(_template, value),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
