import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cubits/exercise/exercise_cubit.dart';

class ExerciseSearchField extends StatelessWidget {
  final _serchController = TextEditingController();

  ExerciseSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ExerciseCubit, ExerciseState>(
      listenWhen: (previous, current) =>
          previous is ExerciseBySearchState &&
          current is ExerciseBySearchState &&
          previous.filter != current.filter,
      listener: (context, state) {
        FocusScope.of(context).unfocus();
        _serchController.clear();
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15.0),
        child: TextField(
          decoration: const InputDecoration(
            labelText: 'Search',
            prefix: Icon(Icons.search),
          ),
          controller: _serchController,
          onChanged: (value) =>
              context.read<ExerciseCubit>().getExercisesBySearch(value),
        ),
      ),
    );
  }
}
