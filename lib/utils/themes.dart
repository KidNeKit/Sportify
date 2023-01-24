import 'package:flutter/material.dart';

import 'styles.dart';

InputDecorationTheme tIntputDecorationTheme = InputDecorationTheme(
  floatingLabelBehavior: FloatingLabelBehavior.always,
  enabledBorder: buildBorder(Colors.purple),
  errorBorder: buildBorder(Colors.red),
  focusedBorder: buildBorder(Colors.blue),

  //suffixStyle:
  //counterStyle:
  //floatingLabelStyle:
  //errorStyle:
  //helperStyle:
  //hintStyle:
  //labelStyle:
  //prefixStyle:
);

TextTheme tTextTheme = TextTheme(
  titleLarge: titleLarge,
  bodyLarge: bodyLarge,
  labelLarge: labelLarge,
  labelMedium: labelMedium,
  labelSmall: labelSmall,
);
