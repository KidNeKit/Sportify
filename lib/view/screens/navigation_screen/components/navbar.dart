import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportify/view/screens/navigation_screen/components/items/nav_item.dart';

import '../../../../cubits/navigation/navigation_cubit.dart';
import '../../../../utils/navigation_data.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      margin: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
        color: Colors.purple.withOpacity(0.5),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) => ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (ctx, index) => NavItem(
                  navIcon: navIcons[index],
                  index: index,
                  isSelected: state.index == index,
                ),
            separatorBuilder: (ctx, index) => const SizedBox(width: 20),
            itemCount: navIcons.length),
      ),
    );
  }
}
