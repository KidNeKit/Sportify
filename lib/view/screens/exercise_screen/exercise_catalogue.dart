import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/exercise/exercise_bloc.dart';
import '../exercise_creation_screen.dart';

class ExercisesCatalogue extends StatelessWidget {
  const ExercisesCatalogue({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.purple.withOpacity(0.5),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Stack(
        children: [
          Positioned(
            right: 0,
            child: IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(ExerciseCreationScreen.routeName);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Exercises Catalogue',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Colors.white),
                ),
                const SizedBox(height: 10.0),
                Row(
                  children: [
                    const Flexible(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Search',
                          prefix: Icon(Icons.search),
                        ),
                      ),
                    ),
                    BlocBuilder<ExerciseBloc, ExerciseState>(
                      builder: (context, state) {
                        return IconButton(
                          onPressed: () {
                            context
                                .read<ExerciseBloc>()
                                .add(GetCustomExercises());
                          },
                          icon: const Icon(Icons.bookmark),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
