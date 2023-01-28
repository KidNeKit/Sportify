import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class PlanItem extends StatelessWidget {
  const PlanItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        children: [
          CircularPercentIndicator(
            radius: 20,
            lineWidth: 3,
            percent: 0.4,
            progressColor: Colors.purple,
            center: const Text('40 %'),
          ),
          const SizedBox(width: 10.0),
          const Text('Skibidi'),
        ],
      ),
    );
  }
}
