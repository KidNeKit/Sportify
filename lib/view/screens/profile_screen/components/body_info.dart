import 'package:flutter/material.dart';
import 'package:sportify/view/screens/profile_screen/components/items/body_info_item.dart';

class BodyInfo extends StatelessWidget {
  const BodyInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          BodyInfoItem(
            title: 'Height',
            value: 185.0,
          ),
          SizedBox(width: 10.0),
          BodyInfoItem(
            title: 'Weight',
            value: 74.0,
          ),
        ],
      ),
    );
  }
}
