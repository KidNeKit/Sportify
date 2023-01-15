import 'package:flutter/material.dart';
import 'package:sportify/view/screens/exercise_screen/exercises_list_view.dart';

import 'exercise_catalogue.dart';

class ExerciseScreen extends StatelessWidget {
  static const String routeName = '/exercises';

  const ExerciseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
    );
  }
}
