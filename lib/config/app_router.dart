import 'package:flutter/material.dart';
import 'package:sportify/view/screens/home_screen.dart';
import 'package:sportify/view/screens/registration_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (ctx) => const HomeScreen());
      case RegistrationScreen.routeName:
        return MaterialPageRoute(builder: (ctx) => const RegistrationScreen());
      default:
        return null;
    }
  }
}
