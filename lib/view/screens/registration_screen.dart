import 'package:flutter/material.dart';

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
            onChanged: (value) {},
          ),
          TextField(
            decoration: const InputDecoration(
              labelText: 'Password',
            ),
            onChanged: (value) {},
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Signup'),
          ),
        ],
      ),
    );
  }
}
