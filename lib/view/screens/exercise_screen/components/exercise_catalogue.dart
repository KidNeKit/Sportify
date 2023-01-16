import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportify/view/screens/exercise_screen/components/exercise_filter_item.dart';

import '../../../../blocs/exercise/exercise_bloc.dart';
import '../../exercise_creation_screen.dart';

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
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Search',
                    prefix: Icon(Icons.search),
                  ),
                ),
                const SizedBox(height: 10.0),
                BlocBuilder<ExerciseBloc, ExerciseState>(
                  builder: (context, state) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ExerciseFilterItem(
                        isActive: state.filter == ExerciseFilter.all,
                        label: 'Default',
                        filterFunc: () =>
                            context.read<ExerciseBloc>().add(GetAllExercises()),
                      ),
                      ExerciseFilterItem(
                        isActive: state.filter == ExerciseFilter.custom,
                        label: 'Custom',
                        filterFunc: () => context
                            .read<ExerciseBloc>()
                            .add(GetCustomExercises()),
                      ),
                      ExerciseFilterItem(
                        isActive: state.filter == ExerciseFilter.bookmarks,
                        label: 'Bookmarks',
                        filterFunc: () => context
                            .read<ExerciseBloc>()
                            .add(GetBookmarkedExercises()),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
