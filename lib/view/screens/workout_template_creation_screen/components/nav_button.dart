import 'package:flutter/material.dart';

import '../../../../models/enums/nav_button_type.dart';

class NavButton extends StatelessWidget {
  final String _label;
  final Function() _onPressedFunc;
  final NavButtonType _buttonType;

  const NavButton(
      {required String label,
      required Function() onPressedFunc,
      required NavButtonType buttonType,
      super.key})
      : _label = label,
        _onPressedFunc = onPressedFunc,
        _buttonType = buttonType;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: _onPressedFunc,
        style: ElevatedButton.styleFrom(
          backgroundColor: _buttonType == NavButtonType.forward
              ? Colors.purple
              : Colors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          side: const BorderSide(color: Colors.purple, width: 2.0),
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
