import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sportify/view/screens/home_screen/components/items/plan_item.dart';

class Plan extends StatelessWidget {
  const Plan({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      //height: 0.5 * height,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.purple,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Today\'s Plan',
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: PlanItem(),
              ),
              const SizedBox(width: 10.0),
              Expanded(
                child: PlanItem(),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: PlanItem(),
              ),
              const SizedBox(width: 10.0),
              Expanded(
                child: PlanItem(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
