import 'package:flutter/material.dart';

import '../models/nav_icon.dart';
import '../view/screens/exercise_screen/exercise_screen.dart';
import '../view/screens/home_screen.dart';
import '../view/screens/workout_screen/workout_screen.dart';

const List<Widget> navPages = [
  HomeScreen(),
  HomeScreen(),
  HomeScreen(),
  WorkoutScreen(),
  ExerciseScreen(),
];

const List<NavIcon> navIcons = [
  NavIcon(icon: Icons.home, label: 'Home'),
  NavIcon(icon: Icons.home, label: 'Home'),
  NavIcon(icon: Icons.home, label: 'Home'),
  NavIcon(icon: Icons.work, label: 'Workouts'),
  NavIcon(icon: Icons.search, label: 'Exercises'),
];
