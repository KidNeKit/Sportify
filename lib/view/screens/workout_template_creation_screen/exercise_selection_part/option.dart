import 'package:flutter/material.dart';

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
