import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportify/models/nav_icon.dart';

import '../../../../../cubits/navigation/navigation_cubit.dart';

class NavItem extends StatefulWidget {
  final NavIcon _navIcon;
  final int _index;
  final bool _isSelected;

  const NavItem(
      {required NavIcon navIcon,
      required int index,
      required bool isSelected,
      super.key})
      : _navIcon = navIcon,
        _index = index,
        _isSelected = isSelected;

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
        Container(
          height: 4,
          width: 20.0,
          decoration: BoxDecoration(
            color: widget._isSelected ? Colors.grey : Colors.transparent,
            borderRadius: BorderRadius.circular(20.0),
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
