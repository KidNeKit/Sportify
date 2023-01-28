import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportify/cubits/navigation/navigation_cubit.dart';

import '../../../../../models/nav_icon.dart';

class NavItem extends StatefulWidget {
  final NavIcon _navIcon;
  final int _index;

  const NavItem({required NavIcon navIcon, required int index, super.key})
      : _navIcon = navIcon,
        _index = index;

  @override
  State<NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<NavItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedContainer(
          duration: const Duration(seconds: 2),
          curve: Curves.easeIn,
          child: BlocBuilder<NavigationCubit, NavigationState>(
            builder: (context, state) {
              log('rebuilding icon ${widget._navIcon.label}');
              return Container(
                height: 4,
                width: state.index == widget._index ? 20.0 : 0.0,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(20.0),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 5.0),
        GestureDetector(
            onTap: () =>
                context.read<NavigationCubit>().changeScreen(widget._index),
            child: Icon(widget._navIcon.icon)),
      ],
    );
  }
}
