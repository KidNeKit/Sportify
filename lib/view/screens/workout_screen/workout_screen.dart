import 'package:flutter/material.dart';

import 'components/scheduler.dart';
import 'components/workout_templates.dart';

class WorkoutScreen extends StatelessWidget {
  const WorkoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Scheduler(),
        WorkoutTemplates(),
      ],
    );
  }
}
