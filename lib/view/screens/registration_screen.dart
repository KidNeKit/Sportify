import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/registration/registration_cubit.dart';

class RegistrationScreen extends StatelessWidget {
  static const routeName = '/registration';
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        ],
      ),
    );
  }
}
