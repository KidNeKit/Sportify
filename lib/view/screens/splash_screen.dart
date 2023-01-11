import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/auth/auth_bloc.dart';
import 'home_screen.dart';
import 'registration_screen.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = '/splash';
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (ctx, state) {
        Timer(
          const Duration(seconds: 1),
          () => Navigator.of(ctx).pushReplacementNamed(
              state.status == AuthStatus.authorized
                  ? HomeScreen.routeName
                  : RegistrationScreen.routeName),
        );
      },
      child: Scaffold(
        body: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          color: Colors.purple,
          child: const Center(
            child: Text(
              'Splash Screen',
              style: TextStyle(
                fontSize: 50.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
