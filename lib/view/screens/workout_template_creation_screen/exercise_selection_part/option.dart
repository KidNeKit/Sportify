import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cubits/exercise_template/exercise_template_cubit.dart';

class Option extends StatelessWidget {
  final String _label;
  final bool _isActive;
  final Function _onSelectOptionFunc;

  const Option(
      {required String label,
      required Function onSelectOptionFunc,
      bool isActive = false,
      super.key})
      : _label = label,
        _onSelectOptionFunc = onSelectOptionFunc,
        _isActive = isActive;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          if (!_isActive) {
            _onSelectOptionFunc();
            context.read<ExerciseTemplateCubit>().switchSelectorOption();
          }
        },
        child: Center(
          child: Text(
            _label,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(color: _isActive ? Colors.white : Colors.black),
          ),
        ),
      ),
    );
  }
}
