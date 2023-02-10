import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../cubits/exercise_template/exercise_template_cubit.dart';
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
                previous.templates != current.templates,
            builder: (ctx, state) {
              return ListView.separated(
                itemCount: state.templates.length,
                separatorBuilder: (context, index) =>
                    const RestSeparatorContainer(),
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
  const RestSeparatorContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        height: 50.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            children: const [
              Text('Rest Time'),
              SizedBox(width: 30.0),
              Expanded(
                child: TextField(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
