import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportify/utils/constants.dart';
import 'package:sportify/utils/validator.dart';
import 'package:sportify/view/custom_widgets/input_fields/custom_text_field.dart';

import '../../blocs/auth/auth_bloc.dart';
import '../../cubits/login/login_cubit.dart';
import '../../utils/styles.dart';
import 'home_screen.dart';
import 'registration_screen.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = '/login';

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Validator _validator = Validator();

  LoginScreen({super.key});

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
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  EmailTextField(validator: _validator),
                  const SizedBox(height: cDefaultWidgetInterval / 2),
                  PasswordTextField(validator: _validator),
                  const SizedBox(height: cDefaultWidgetInterval),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<LoginCubit>().signIn();
                      }
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
      ),
    );
  }
}

class EmailTextField extends StatelessWidget {
  final Validator _validator;
  const EmailTextField({required Validator validator, super.key})
      : _validator = validator;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        String? errorText = state.status == LoginStatus.error
            ? 'Error due login on firebase side'
            : null;
        return CustomTextField(
          hint: 'Email',
          errorText: errorText,
          onChangedFunc: (value) =>
              context.read<LoginCubit>().emailChanged(value),
          validatorFunc: (value) => _validator.validateEmail(value),
        );
      },
    );
  }
}

class PasswordTextField extends StatelessWidget {
  final Validator _validator;
  const PasswordTextField({required Validator validator, super.key})
      : _validator = validator;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      hint: 'Password',
      onChangedFunc: (value) =>
          context.read<LoginCubit>().passwordChanged(value),
      validatorFunc: (value) => _validator.validatePassword(value),
    );
  }
}
