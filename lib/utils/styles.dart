import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const sDefaultScreenPadding = EdgeInsets.all(20.0);

InputDecorationTheme sIntputDecorationTheme = InputDecorationTheme(
  floatingLabelBehavior: FloatingLabelBehavior.always,
  enabledBorder: _buildBorder(Colors.purple),
  errorBorder: _buildBorder(Colors.red),
  focusedBorder: _buildBorder(Colors.blue),

  //suffixStyle:
  //counterStyle:
  //floatingLabelStyle:
  //errorStyle:
  //helperStyle:
  //hintStyle:
  //labelStyle:
  //prefixStyle:
);

OutlineInputBorder _buildBorder(Color color) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(20.0),
    borderSide: BorderSide(
      color: color,
      width: 1.0,
    ),
  );
}
