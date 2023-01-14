import 'package:flutter/material.dart';

OutlineInputBorder buildBorder(Color color) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(20.0),
    borderSide: BorderSide(
      color: color,
      width: 1.0,
    ),
  );
}

TextStyle titleLarge = const TextStyle(
  fontFamily: 'DMSans',
  fontWeight: FontWeight.w700,
  fontSize: 30.0,
  color: Colors.black,
);

TextStyle labelLarge = const TextStyle(
  fontFamily: 'DMSans',
  fontWeight: FontWeight.w400,
  fontSize: 20.0,
  color: Colors.black,
);

TextStyle labelMedium = const TextStyle(
  fontFamily: 'DMSans',
  fontWeight: FontWeight.w400,
  fontSize: 18.0,
  color: Colors.black,
);

TextStyle labelSmall = const TextStyle(
  fontFamily: 'DMSans',
  fontWeight: FontWeight.w400,
  fontSize: 14.0,
  color: Colors.black,
);
