import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportify/view/screens/exercise_screen/exercise_screen.dart';

import '../cubits/login/login_cubit.dart';
import '../cubits/registration/registration_cubit.dart';
import '../repositories/auth_repository.dart';
import '../view/screens/auth/login_screen.dart';
import '../view/screens/auth/registration_screen.dart';
import '../view/screens/home_screen.dart';
import '../view/screens/splash_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.routeName:
        return MaterialPageRoute(builder: (ctx) => const SplashScreen());
      case LoginScreen.routeName:
        return MaterialPageRoute(
            builder: (ctx) => BlocProvider(
                  create: (ctx) =>
                      LoginCubit(authRepository: ctx.read<AuthRepository>()),
                  child: const LoginScreen(),
                ));
      case RegistrationScreen.routeName:
        return MaterialPageRoute(
            builder: (ctx) => BlocProvider(
                  create: (ctx) => RegistrationCubit(
                      authRepository: ctx.read<AuthRepository>()),
                  child: const RegistrationScreen(),
                ));
      case HomeScreen.routeName:
        return MaterialPageRoute(builder: (ctx) => const HomeScreen());
      case ExerciseScreen.routeName:
        return MaterialPageRoute(builder: (ctx) => const ExerciseScreen());
      default:
        return null;
    }
  }
}
