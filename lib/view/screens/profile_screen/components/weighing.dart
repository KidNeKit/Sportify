import 'package:flutter/material.dart';

class Weighing extends StatelessWidget {
  const Weighing({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          width: double.infinity,
          margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 15.0),
          decoration: BoxDecoration(
            color: Colors.purple,
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text('Add weighing'),
        ),
      ],
    );
  }
}
