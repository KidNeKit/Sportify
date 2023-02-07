import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportify/models/enums/nav_button_type.dart';
import 'package:sportify/view/screens/workout_template_creation_screen/components/nav_button.dart';

import '../../../../cubits/exercise_template/exercise_template_cubit.dart';

class PartNavButtons extends StatelessWidget {
  const PartNavButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 20.0),
      child: Row(
        children: [
          NavButton(
            label: 'Cancel',
            buttonType: NavButtonType.back,
            onPressedFunc: () => Navigator.of(context).pop(),
          ),
          const SizedBox(width: 15.0),
          NavButton(
              label: 'Next',
              buttonType: NavButtonType.forward,
              onPressedFunc: () {
                if (context
                    .read<ExerciseTemplateCubit>()
                    .state
                    .templates
                    .isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      duration: Duration(seconds: 1),
                      content: Text('Please select at least one exercise')));
                  return;
                }
                context.read<ExerciseTemplateCubit>().nextStep();
              }),
        ],
      ),
    );
  }
}
