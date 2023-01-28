import 'package:flutter/material.dart';
import 'package:sportify/view/screens/home_screen/components/calendar.dart';

import 'components/plan.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: const [
        Calendar(),
        SizedBox(height: 10.0),
        Plan(),
      ],
    );
  }
}
