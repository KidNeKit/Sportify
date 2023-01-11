import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportify/view/screens/home_screen.dart';
import 'package:sportify/view/screens/login_screen.dart';

import '../../blocs/auth/auth_bloc.dart';
import '../../cubits/registration/registration_cubit.dart';

class RegistrationScreen extends StatelessWidget {
  static const routeName = '/registration';
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (ctx, state) {
        log('{Registration Screen} Auth state: ${state.toString()}');
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
                context.read<RegistrationCubit>().emailChanged(value);
              },
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              onChanged: (value) {
                context.read<RegistrationCubit>().passwordChanged(value);
              },
            ),
            ElevatedButton(
              onPressed: () {
                context.read<RegistrationCubit>().signup();
              },
              child: const Text('Signup'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context)
                  .pushReplacementNamed(LoginScreen.routeName),
              child: const Text('Go to login'),
            ),
          ],
        ),
      ),
    );
  }
}
