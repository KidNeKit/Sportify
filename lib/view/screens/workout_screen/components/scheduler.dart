import 'package:flutter/material.dart';
import 'package:sportify/models/enums/weekdays.dart';
import 'package:sportify/view/screens/workout_screen/components/items/weekday_item.dart';

class Scheduler extends StatelessWidget {
  const Scheduler({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        padding: const EdgeInsets.only(
            left: 10.0, right: 10.0, top: 10.0, bottom: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Weekly Scheduler',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:
                  Weekdays.values.map((e) => WeekDayItem(weekday: e)).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
