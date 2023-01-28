import 'package:flutter/material.dart';

import '../../../../utils/navigation_data.dart';
import 'items/nav_item.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.purple.withOpacity(0.5),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ...List.generate(
            navIcons.length,
            (index) => NavItem(
              navIcon: navIcons[index],
              index: index,
            ),
          ),
        ],
      ),
    );
  }
}
