import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportify/view/screens/registration_screen.dart';

import '../../blocs/auth/auth_bloc.dart';
import '../../cubits/login/login_cubit.dart';
import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = '/login';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (ctx, state) {
        log('{Login Screen} Auth state: ${state.toString()}');
        if (state.status == AuthStatus.authorized) {
          Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
        }
      },
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
              onChanged: (value) {
                context.read<LoginCubit>().emailChanged(value);
              },
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              onChanged: (value) {
                context.read<LoginCubit>().passwordChanged(value);
              },
            ),
            ElevatedButton(
              onPressed: () {
                context.read<LoginCubit>().signIn();
              },
              child: const Text('Signin'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context)
                  .pushReplacementNamed(RegistrationScreen.routeName),
              child: const Text('Go to registration'),
            ),
          ],
        ),
      ),
    );
  }
}
