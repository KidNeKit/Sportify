import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportify/cubits/workout_template/workout_template_cubit.dart';
import 'package:sportify/view/screens/workout_template_creation_screen/workout_templatE_creation_screen.dart';

class WorkoutTemplates extends StatelessWidget {
  const WorkoutTemplates({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(
            'My Workout Templates',
            style: Theme.of(context).textTheme.labelLarge,
          ),
          TextButton(
              onPressed: () {
                Navigator.pushNamed(
                    context, WorkoutTemplateCreationScreen.routeName);
              },
              child: const Text('Add new template')),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: BlocBuilder<WorkoutTemplateCubit, WorkoutTemplateState>(
                builder: (context, state) {
                  log(state.toString());
                  return Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(),
                    ),
                    child: Center(child: Text('skib')),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
