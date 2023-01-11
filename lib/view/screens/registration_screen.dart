import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportify/cubits/registration/registration_cubit.dart';

class RegistrationScreen extends StatelessWidget {
  static const routeName = '/registration';
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<RegistrationCubit, RegistrationState>(
            buildWhen: (previous, current) => previous.email != current.email,
            builder: (ctx, state) {
              return TextField(
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
                onChanged: (value) {
                  ctx.read<RegistrationCubit>().emailChanged(value);
                },
              );
            },
          ),
          BlocBuilder<RegistrationCubit, RegistrationState>(
            buildWhen: (previous, current) =>
                previous.password != current.password,
            builder: (ctx, state) {
              return TextField(
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
                onChanged: (value) {
                  ctx.read<RegistrationCubit>().passwordChanged(value);
                },
              );
            },
          ),
          ElevatedButton(
            onPressed: () {
              context.read<RegistrationCubit>().signup();
            },
            child: const Text('Signup'),
          ),
          BlocBuilder<RegistrationCubit, RegistrationState>(
            buildWhen: (previous, current) => previous.status != current.status,
            builder: ((context, state) => state.status ==
                    RegistrationStatus.processing
                ? const Text('Registration is in progress')
                : Text('Email: ${state.email}, Password: ${state.password}')),
          ),
        ],
      ),
    );
  }
}
