import 'package:flutter/material.dart';

class ExerciseFilterItem extends StatelessWidget {
  final bool _isActive;
  final String _label;
  final Function()? _filterFunc;
  const ExerciseFilterItem(
      {required bool isActive,
      required String label,
      required void Function()? filterFunc,
      super.key})
      : _isActive = isActive,
        _label = label,
        _filterFunc = filterFunc;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _filterFunc,
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: _isActive ? Colors.purple : Colors.purple.withOpacity(0.5),
          border: Border.all(color: Colors.purple),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Text(
          _label,
          style: Theme.of(context)
              .textTheme
              .labelMedium!
              .copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
