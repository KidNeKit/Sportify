import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/auth/auth_bloc.dart';
import '../../cubits/registration/registration_cubit.dart';
import 'home_screen.dart';
import 'login_screen.dart';

class RegistrationScreen extends StatelessWidget {
  static const routeName = '/registration';
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    log('building registration screen');
    return BlocListener<AuthBloc, AuthState>(
      listener: (ctx, state) {
        log('{Registration Screen} Auth state: ${state.toString()}');
        if (state.status == AuthStatus.authorized) {
          Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: SizedBox(
            height: size.height,
            width: double.infinity,
            child: Stack(
              children: [
                Positioned(
                  top: -100,
                  left: -100,
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.purple.withOpacity(0.5),
                    ),
                  ),
                ),
                Positioned(
                  bottom: -120,
                  right: -80,
                  child: Container(
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.purple.withOpacity(0.5),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextField(
                          decoration: const InputDecoration(
                            labelText: 'Email',
                          ),
                          onChanged: (value) {
                            context
                                .read<RegistrationCubit>()
                                .emailChanged(value);
                          },
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          decoration: const InputDecoration(
                            labelText: 'Password',
                          ),
                          onChanged: (value) {
                            context
                                .read<RegistrationCubit>()
                                .passwordChanged(value);
                          },
                        ),
                        const SizedBox(height: 10),
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
                ),
              ],
            ),
          ),
        ),
      ),
      //   body: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //
      //     ],
      //   ),
      // ),
    );
  }
}
