import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportify/cubits/user/user_cubit.dart';
import 'package:sportify/view/screens/onboarding_screen/onboarding_screen.dart';

import '../../../blocs/auth/auth_bloc.dart';
import '../../../cubits/registration/registration_cubit.dart';
import '../home_screen.dart';
import 'auth_background.dart';
import 'login_screen.dart';

class RegistrationScreen extends StatelessWidget {
  static const routeName = '/registration';
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    log('building registration screen');
    return BlocListener<AuthBloc, AuthState>(
      listener: (ctx, state) {
        log('{Registration Screen} Auth state: ${state.toString()}');
        if (state.status == AuthStatus.authorized) {
          Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
        }
      },
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: AuthBackground(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Email',
                    ),
                    onChanged: (value) {
                      context.read<UserCubit>().changeEmail(value);
                    },
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Password',
                    ),
                    onChanged: (value) {
                      context.read<UserCubit>().changePassword(value);
                    },
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      //context.read<RegistrationCubit>().signup();
                      Navigator.of(context)
                          .pushNamed(OnboardingScreen.routeName);
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
          ),
        ),
      ),
    );
  }
}
