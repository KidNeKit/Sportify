import 'package:flutter/material.dart';

class BodyInfoItem extends StatelessWidget {
  final String _title;
  final double _value;

  const BodyInfoItem({required String title, required double value, super.key})
      : _title = title,
        _value = value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        elevation: 5.0,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(_title, style: Theme.of(context).textTheme.labelMedium),
              const SizedBox(width: 5.0),
              Text(_value.toString(),
                  style: Theme.of(context).textTheme.labelMedium),
            ],
          ),
        ),
      ),
    );
  }
}
