import 'package:flutter/material.dart';

class RepItem extends StatelessWidget {
  final int _repNumer;

  const RepItem({required int repNumber, super.key}) : _repNumer = repNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Center(
        child: Text(
          'Rep $_repNumer',
          style: Theme.of(context).textTheme.labelMedium,
        ),
      ),
    );
  }
}
