import 'package:flutter/material.dart';
import 'package:sportify/view/screens/workout_template_creation_screen/workout_templatE_creation_screen.dart';

class WorkoutTemplates extends StatelessWidget {
  const WorkoutTemplates({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('My Templates'),
        Container(),
        TextButton(
            onPressed: () {
              Navigator.pushNamed(
                  context, WorkoutTemplateCreationScreen.routeName);
            },
            child: const Text('Add new template')),
      ],
    );
  }
}
