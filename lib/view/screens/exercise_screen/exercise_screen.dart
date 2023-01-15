import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportify/cubits/exercise/exercise_bloc.dart';
import 'package:sportify/repositories/exercise_repository.dart';

import 'exercise_catalogue.dart';
import 'exercises_list_view.dart';

class ExerciseScreen extends StatelessWidget {
  static const String routeName = '/exercises';

  const ExerciseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ExerciseBloc>(
        create: (ctx) =>
            ExerciseBloc(exerciseRepository: ctx.read<ExerciseRepository>())
              ..add(GetAllExercises()),
        child: SafeArea(
          child: Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: const [
                ExercisesCatalogue(),
                ExercisesListView(),
              ],
            ),
          ),
        ));
  }
}
