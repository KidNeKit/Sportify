import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/navigation/navigation_cubit.dart';
import '../../../utils/navigation_data.dart';
import 'components/navbar.dart';

class NavigationScreen extends StatelessWidget {
  static const String routeName = '/navigation';

  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          return navPages[state.index];
        },
      ),
      bottomNavigationBar: const NavBar(),
    );
  }
}
