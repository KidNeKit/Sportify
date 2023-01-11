import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportify/utils/constants.dart';

import '../../blocs/auth/auth_bloc.dart';
import '../../cubits/login/login_cubit.dart';
import '../../utils/styles.dart';
import '../custom_widgets/custom_text_field.dart';
import 'home_screen.dart';
import 'registration_screen.dart';

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
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: sDefaultScreenPadding,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextField(
                  labelText: 'Email',
                  obscureText: false,
                  onChangedFunc: (value) =>
                      context.read<LoginCubit>().emailChanged(value),
                ),
                const SizedBox(height: cDefaultWidgetInterval),
                CustomTextField(
                  labelText: 'Password',
                  obscureText: true,
                  onChangedFunc: (value) =>
                      context.read<LoginCubit>().passwordChanged(value),
                ),
                const SizedBox(height: cDefaultWidgetInterval),
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
        ),
      ),
    );
  }
}
