import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cubits/exercise_template/exercise_template_cubit.dart';
import '../../auth/auth_background.dart';
import 'exercise_template_config_screen/exercise_template_list.dart';

class ExerciseTemplateConfigScreen extends StatelessWidget {
  const ExerciseTemplateConfigScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthBackground(
      child: SafeArea(
        child: Column(
          children: [
            const ExerciseTemplateList(),
            ElevatedButton(
                onPressed: () {
                  context.read<ExerciseTemplateCubit>().prevStep();
                },
                child: const Text('Go Back')),
          ],
        ),
      ),
    );
  }
}
