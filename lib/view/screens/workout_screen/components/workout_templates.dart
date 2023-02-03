import 'package:flutter/material.dart';

class WorkoutTemplates extends StatelessWidget {
  const WorkoutTemplates({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('My Templates'),
        Container(),
        TextButton(onPressed: () {}, child: const Text('Add new template')),
      ],
    );
  }
}
