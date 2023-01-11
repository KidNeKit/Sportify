import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportify/cubits/registration/registration_cubit.dart';
import 'package:sportify/repositories/auth_repository.dart';
import 'package:sportify/view/screens/home_screen.dart';
import 'package:sportify/view/screens/registration_screen.dart';

import 'package:bloc/bloc.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (ctx) => const HomeScreen());
      case RegistrationScreen.routeName:
        return MaterialPageRoute(
            builder: (ctx) => BlocProvider(
                  create: (ctx) => RegistrationCubit(
                      authRepository: ctx.read<AuthRepository>()),
                  child: const RegistrationScreen(),
                ));
      default:
        return null;
    }
  }
}
