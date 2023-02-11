import 'package:flutter/material.dart';

import '../auth/auth_background.dart';
import 'components/part_nav_buttons.dart';

class WorkoutCreationFinalScreen extends StatelessWidget {
  const WorkoutCreationFinalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthBackground(
      child: SafeArea(
        child: Column(
          children: const [
            PartNavButtonsFinal(),
          ],
        ),
      ),
    );
  }
}
