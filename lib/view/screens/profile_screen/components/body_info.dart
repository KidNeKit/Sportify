import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportify/view/screens/profile_screen/components/items/body_info_item.dart';

import '../../../../cubits/user/user_cubit.dart';

class BodyInfo extends StatelessWidget {
  const BodyInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BlocBuilder<UserCubit, UserState>(
            buildWhen: (previous, current) => previous.height != current.height,
            builder: (context, state) {
              return BodyInfoItem(
                title: 'Height',
                value: state.height,
              );
            },
          ),
          const SizedBox(width: 10.0),
          BlocBuilder<UserCubit, UserState>(
            buildWhen: (previous, current) => previous.weight != current.weight,
            builder: (context, state) {
              return BodyInfoItem(
                title: 'Weight',
                value: state.weight,
              );
            },
          ),
        ],
      ),
    );
  }
}
