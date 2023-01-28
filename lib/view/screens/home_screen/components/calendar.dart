import 'dart:developer';

import 'package:flutter/material.dart';

class Calendar extends StatelessWidget {
  const Calendar({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: 0.2 * height,
      width: double.infinity,
      color: Colors.purple,
    );
  }
}
