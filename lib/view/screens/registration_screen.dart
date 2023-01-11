import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportify/blocs/auth/auth_bloc.dart';
import 'package:sportify/cubits/registration/registration_cubit.dart';
import 'package:sportify/view/screens/home_screen.dart';

class RegistrationScreen extends StatelessWidget {
  static const routeName = '/registration';
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (ctx, state) {
        if (state.status == AuthStatus.authorized) {
          Navigator.of(context).pushNamed(HomeScreen.routeName);
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
            BlocBuilder<RegistrationCubit, RegistrationState>(
              buildWhen: (previous, current) =>
                  previous.status != current.status,
              builder: ((context, state) {
                log(context.read<AuthBloc>().state.toString());
                if (state.status == RegistrationStatus.processing) {
                  return const CircularProgressIndicator();
                } else if (state.status == RegistrationStatus.success) {
                  return Text(
                      'Email: ${state.email}, Password: ${state.password}');
                }
                return const Text('initial state');
              }),
            ),
          ],
        ),
      ),
    );
  }
}
