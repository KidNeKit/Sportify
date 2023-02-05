import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../blocs/exercise/exercise_bloc.dart';
import '../../exercise_creation_screen/exercise_creation_screen.dart';
import 'exercise_filter_item.dart';

class ExercisesCatalogue extends StatelessWidget {
  final _serchController = TextEditingController();

  ExercisesCatalogue({
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
                BlocListener<ExerciseBloc, ExerciseState>(
                  listenWhen: (previous, current) =>
                      previous.filter != current.filter,
                  listener: (context, state) {
                    FocusScope.of(context).unfocus();
                    _serchController.clear();
                  },
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: 'Search',
                      prefix: Icon(Icons.search),
                    ),
                    controller: _serchController,
                    onChanged: (value) =>
                        context.read<ExerciseBloc>().add(GetBySearch(value)),
                  ),
                ),
                const SizedBox(height: 10.0),
                BlocBuilder<ExerciseBloc, ExerciseState>(
                  builder: (context, state) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ExerciseFilterItem(
                        isActive: state.filter == ExerciseFilter.def,
                        label: 'Default',
                        filterFunc: () {
                          if (state.filter != ExerciseFilter.def) {
                            context
                                .read<ExerciseBloc>()
                                .add(GetDefaultExercises());
                          }
                        },
                      ),
                      ExerciseFilterItem(
                        isActive: state.filter == ExerciseFilter.custom,
                        label: 'Custom',
                        filterFunc: () {
                          if (state.filter != ExerciseFilter.custom) {
                            context
                                .read<ExerciseBloc>()
                                .add(GetCustomExercises());
                          }
                        },
                      ),
                      ExerciseFilterItem(
                        isActive: state.filter == ExerciseFilter.bookmarks,
                        label: 'Bookmarks',
                        filterFunc: () {
                          if (state.filter != ExerciseFilter.bookmarks) {
                            context
                                .read<ExerciseBloc>()
                                .add(GetBookmarkedExercises());
                          }
                        },
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
