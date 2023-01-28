import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/auth/auth_bloc.dart';
import '../../../cubits/login/login_cubit.dart';
import '../../custom_widgets/input_fields/custom_text_field.dart';
import '../home_screen/home_screen.dart';
import 'auth_background.dart';
import 'registration_screen.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = '/login';

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    log('building login screen');
    return BlocListener<AuthBloc, AuthState>(
      listener: (ctx, state) {
        log('{Login Screen} Auth state: ${state.toString()}');
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
                  Text(
                    'Welcome back!',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 40),
                  const EmailTextField(),
                  const SizedBox(height: 10),
                  const PasswordTextField(),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () => context.read<LoginCubit>().signIn(),
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
      ),
    );
  }
}

class EmailTextField extends StatelessWidget {
  const EmailTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
        buildWhen: (previous, current) =>
            previous.emailError != current.emailError,
        builder: (context, state) => CustomTextField(
              hint: 'Email',
              errorText: state.emailError,
              onChangedFunc: (value) =>
                  context.read<LoginCubit>().emailChanged(value),
            ));
  }
}

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
        buildWhen: (previous, current) =>
            previous.passwordError != current.passwordError,
        builder: (ctx, state) => CustomTextField(
              hint: 'Password',
              errorText: state.passwordError,
              onChangedFunc: (value) =>
                  context.read<LoginCubit>().passwordChanged(value),
            ));
  }
}
