import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportify/cubits/navigation/navigation_cubit.dart';

import '../../../../../models/nav_icon.dart';

class NavItem extends StatelessWidget {
  final NavIcon _navIcon;
  final int _index;

  const NavItem({required NavIcon navIcon, required int index, super.key})
      : _navIcon = navIcon,
        _index = index;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BlocBuilder<NavigationCubit, NavigationState>(
          builder: (context, state) => AnimatedContainer(
            width: state.index == _index ? 28.0 : 0.0,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeIn,
            child: Container(
              height: 4,
              decoration: BoxDecoration(
                color: const Color(0xFF00ABB3),
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
        ),
        const SizedBox(height: 5.0),
        GestureDetector(
            onTap: () => context.read<NavigationCubit>().changeScreen(_index),
            child: Icon(
              _navIcon.icon,
              size: 32,
              color: const Color(0xFFB2B2B2),
            )),
      ],
    );
  }
}
