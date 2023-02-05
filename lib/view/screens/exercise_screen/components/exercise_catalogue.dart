import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cubits/exercise/exercise_cubit.dart';
import '../../../../models/enums/exercise_filter.dart';
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
                BlocListener<ExerciseCubit, ExerciseState>(
                  listenWhen: (previous, current) =>
                      previous is ExerciseBySearchState &&
                      current is ExerciseBySearchState &&
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
                    onChanged: (value) => context
                        .read<ExerciseCubit>()
                        .getExercisesBySearch(value),
                  ),
                ),
                const SizedBox(height: 10.0),
                BlocBuilder<ExerciseCubit, ExerciseState>(
                    builder: (context, state) {
                  if (state is ExerciseErrorState) {
                    return const Text('There was an error');
                  } else if (state is ExerciseBySearchState ||
                      state is ExerciseLoadingState) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ExerciseFilterItem(
                          isActive: state.filter == ExerciseFilter.def,
                          label: 'Default',
                          filterFunc: () {
                            if (state.filter != ExerciseFilter.def) {
                              context
                                  .read<ExerciseCubit>()
                                  .getDefaultExercises();
                            }
                          },
                        ),
                        ExerciseFilterItem(
                          isActive: state.filter == ExerciseFilter.custom,
                          label: 'Custom',
                          filterFunc: () {
                            if (state.filter != ExerciseFilter.custom) {
                              context
                                  .read<ExerciseCubit>()
                                  .getCustomExercises();
                            }
                          },
                        ),
                        ExerciseFilterItem(
                          isActive: state.filter == ExerciseFilter.bookmarks,
                          label: 'Bookmarks',
                          filterFunc: () {
                            if (state.filter != ExerciseFilter.bookmarks) {
                              context
                                  .read<ExerciseCubit>()
                                  .getBookmarkedExercises();
                            }
                          },
                        ),
                      ],
                    );
                  }
                  return Container();
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
