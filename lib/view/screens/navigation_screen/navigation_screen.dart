import 'package:flutter/material.dart';

import '../exercise_screen/exercise_screen.dart';
import 'components/navigation_bar.dart' as nav;

class NavigationScreen extends StatelessWidget {
  static const String routeName = '/navigation';

  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: ExerciseScreen(),
      bottomNavigationBar: nav.NavigationBar(),
    );
  }
}
