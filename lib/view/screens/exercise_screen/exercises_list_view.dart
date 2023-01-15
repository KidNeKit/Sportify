import 'package:flutter/material.dart';

class ExercisesListView extends StatelessWidget {
  const ExercisesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (ctx, index) => Text('Exercise ${index + 1}')),
      ),
    );
  }
}
