import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportify/blocs/auth/auth_bloc.dart';
import 'package:sportify/view/screens/login_screen.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (ctx, state) {
        log('{Home Screen} Auth state: ${state.toString()}');
        if (state.status == AuthStatus.unauthorized) {
          Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home Screen'),
        ),
        body: Column(
          children: [
            const Center(
              child: Text('Home'),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<AuthBloc>().add(const LogOutRequested());
              },
              child: const Text('Log out'),
            ),
          ],
        ),
      ),
    );
  }
}
