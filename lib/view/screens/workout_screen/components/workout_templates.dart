import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportify/cubits/workout_template/workout_template_cubit.dart';
import 'package:sportify/models/enums/operation_status.dart';
import 'package:sportify/view/screens/workout_screen/components/items/workout_template_item.dart';
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
            child: BlocBuilder<WorkoutTemplateCubit, WorkoutTemplateState>(
              builder: (context, state) {
                if (state.status == OperationStatus.loading) {
                  return const CircularProgressIndicator();
                }
                return ListView.separated(
                  padding: const EdgeInsets.only(top: 0),
                  itemCount: state.templates.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 10.0),
                  itemBuilder: (context, index) =>
                      WorkoutTemplateItem(template: state.templates[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
