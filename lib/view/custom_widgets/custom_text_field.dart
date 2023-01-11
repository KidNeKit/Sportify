import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String _labelText;
  final bool _obscureText;
  final Function(String) _onChangedFunc;

  const CustomTextField(
      {required String labelText,
      required bool obscureText,
      required Function(String) onChangedFunc,
      super.key})
      : _labelText = labelText,
        _obscureText = obscureText,
        _onChangedFunc = onChangedFunc;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: _obscureText,
      decoration: InputDecoration(
        labelText: _labelText,
        border: const OutlineInputBorder(),
      ),
      onChanged: _onChangedFunc,
    );
  }
}
