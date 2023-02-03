import 'package:flutter/material.dart';
import 'package:sportify/view/screens/profile_screen/profile_screen.dart';

import '../models/nav_icon.dart';
import '../view/screens/exercise_screen/exercise_screen.dart';
import '../view/screens/home_screen.dart';
import '../view/screens/workout_screen/workout_screen.dart';

const List<Widget> navPages = [
  HomeScreen(),
  HomeScreen(),
  WorkoutScreen(),
  ExerciseScreen(),
  ProfileScreen(),
];

const List<NavIcon> navIcons = [
  NavIcon(icon: Icons.home, label: 'Home'),
  NavIcon(icon: Icons.home, label: 'Home'),
  NavIcon(icon: Icons.work, label: 'Workouts'),
  NavIcon(icon: Icons.search, label: 'Exercises'),
  NavIcon(icon: Icons.man, label: 'Profile'),
];
