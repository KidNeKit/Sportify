import 'package:flutter/material.dart';
import 'package:sportify/models/exercise_rep.dart';

class RepItem extends StatelessWidget {
  final ExerciseRep _rep;
  final int _index;

  const RepItem({required ExerciseRep rep, required int index, super.key})
      : _rep = rep,
        _index = index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 3.0),
      width: double.infinity,
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.purple,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Center(
        child: Text(
          'Rep ${_index + 1}',
          style: Theme.of(context).textTheme.labelMedium,
        ),
      ),
    );
  }
}
