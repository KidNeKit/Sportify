import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/exercise/exercise_bloc.dart';
import '../../../repositories/exercise_repository.dart';
import 'components/exercise_catalogue.dart';
import 'components/exercises_list_view.dart';

class ExerciseScreen extends StatelessWidget {
  static const String routeName = '/exercises';

  const ExerciseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ExerciseBloc>(
        create: (ctx) =>
            ExerciseBloc(exerciseRepository: ctx.read<ExerciseRepository>())
              ..add(GetDefaultExercises()),
        child: SafeArea(
          child: Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                ExercisesCatalogue(),
                const ExercisesListView(),
              ],
            ),
          ),
        ));
  }
}
