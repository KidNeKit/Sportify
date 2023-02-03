import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportify/cubits/registration/registration_cubit.dart';
import 'package:sportify/cubits/user/user_cubit.dart';

class OnboardingScreen extends StatelessWidget {
  static const String routeName = '/onboarding';
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Enter your height'),
          TextField(
            onChanged: (value) {
              context.read<UserCubit>().changeHeight(value);
            },
          ),
          Text('Enter your weight'),
          TextField(
            onChanged: (value) {
              context.read<UserCubit>().changeWeight(value);
            },
          ),
          Text('Enter your username'),
          TextField(
            onChanged: (value) {
              context.read<UserCubit>().changeUsername(value);
            },
          ),
          BlocBuilder<UserCubit, UserState>(
            builder: (context, state) {
              return Text('$state');
            },
          ),
          ElevatedButton(
              onPressed: () => context.read<UserCubit>().signup(),
              child: const Text('Sign Up')),
        ],
      ),
    );
  }
}
