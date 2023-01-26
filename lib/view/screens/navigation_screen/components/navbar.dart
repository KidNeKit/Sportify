import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cubits/navigation/navigation_cubit.dart';
import '../../../../utils/navigation_data.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      color: Colors.purple,
      child: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          return ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, index) => GestureDetector(
                  onTap: () => ctx.read<NavigationCubit>().changeScreen(index),
                  child: Icon(navIcons[index].icon)),
              separatorBuilder: (ctx, index) => const SizedBox(width: 20),
              itemCount: navIcons.length);
        },
      ),
    );
  }
}
