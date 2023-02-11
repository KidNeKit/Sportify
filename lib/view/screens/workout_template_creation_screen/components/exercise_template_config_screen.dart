import 'package:flutter/material.dart';

import '../../auth/auth_background.dart';
import 'exercise_template_config_screen/exercise_template_list.dart';
import 'part_nav_buttons.dart';

class ExerciseTemplateConfigScreen extends StatelessWidget {
  const ExerciseTemplateConfigScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthBackground(
      child: SafeArea(
        child: Column(
          children: const [
            ExerciseTemplateList(),
            PartNavButtonsConfig(),
          ],
        ),
      ),
    );
  }
}
