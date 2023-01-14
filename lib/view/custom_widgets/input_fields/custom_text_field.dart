import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String _hint;
  final Function(String) _onChangedFunc;
  final String? _errorText;

  const CustomTextField(
      {required String hint,
      required Function(String) onChangedFunc,
      String? errorText,
      super.key})
      : _hint = hint,
        _onChangedFunc = onChangedFunc,
        _errorText = errorText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: _hint,
        helperText: '',
        errorText: _errorText,
      ),
      onChanged: _onChangedFunc,
    );
  }
}
