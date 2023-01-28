import 'package:flutter/material.dart';

import '../models/nav_icon.dart';
import '../view/screens/exercise_screen/exercise_screen.dart';
import '../view/screens/home_screen/home_screen.dart';
import '../view/screens/logout_screen.dart';

const List<Widget> navPages = [
  HomeScreen(),
  LogoutScreen(),
  HomeScreen(),
  HomeScreen(),
  ExerciseScreen(),
];

const List<NavIcon> navIcons = [
  NavIcon(icon: Icons.home, label: 'Home'),
  NavIcon(icon: Icons.logout, label: 'Logout'),
  NavIcon(icon: Icons.home, label: 'Home'),
  NavIcon(icon: Icons.home, label: 'Home'),
  NavIcon(icon: Icons.search, label: 'Exercises'),
];
