import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportify/cubits/exercise_template/exercise_template_cubit.dart';

class ExerciseConfigItem extends StatelessWidget {
  final String _exerciseName;
  final bool _isExpanded;
  final int _index;

  const ExerciseConfigItem(
      {required String exerciseName,
      required int index,
      bool isExpanded = false,
      super.key})
      : _exerciseName = exerciseName,
        _index = index,
        _isExpanded = isExpanded;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            context.read<ExerciseTemplateCubit>().expandExercise(_exerciseName);
          },
          child: Container(
            height: 50,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Card(
              elevation: 5.0,
              child: Center(
                child: Text(_exerciseName),
              ),
            ),
          ),
        ),
        BlocBuilder<ExerciseTemplateCubit, ExerciseTemplateState>(
          builder: (context, state) {
            return AnimatedContainer(
              height: state.templates[_index].isExpanded ? 50.0 : 0.0,
              duration: const Duration(milliseconds: 200),
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 20.0),
                decoration: const BoxDecoration(
                  color: Colors.amber,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
