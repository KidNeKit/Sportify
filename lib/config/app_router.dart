import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportify/cubits/login/login_cubit.dart';

import '../cubits/registration/registration_cubit.dart';
import '../repositories/auth_repository.dart';
import '../view/screens/home_screen.dart';
import '../view/screens/login_screen.dart';
import '../view/screens/registration_screen.dart';
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
                  child: LoginScreen(),
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
      default:
        return null;
    }
  }
}
