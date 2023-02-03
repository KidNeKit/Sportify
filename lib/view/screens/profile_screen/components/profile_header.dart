import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportify/cubits/user/user_cubit.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    double headerHeight = 0.15 * MediaQuery.of(context).size.height;
    double headerWidth = MediaQuery.of(context).size.width;
    double imgRadius = 0.3 * headerHeight;
    double imgWrapperRadius = 0.33 * headerHeight;
    double leftMargin = 0.1 * headerWidth;

    return Stack(
      children: [
        SizedBox(
          height: headerHeight,
          width: double.infinity,
        ),
        Container(
          height: headerHeight / 1.5,
          width: double.infinity,
          color: Colors.purple,
        ),
        Positioned(
          top: headerHeight / 1.5 - imgWrapperRadius,
          left: leftMargin - (imgWrapperRadius - imgRadius),
          child: Container(
            height: 2 * imgWrapperRadius,
            width: 2 * imgWrapperRadius,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          top: headerHeight / 1.5 - imgRadius,
          left: leftMargin,
          child: CircleAvatar(
            radius: imgRadius,
            backgroundImage: const NetworkImage(
                'https://yt3.googleusercontent.com/ujIdSyuXFuAjbBRMS3RuFDm2TFDj_6YMcqT1bfUGrA8bkX3rwlbMhewQAIG--BcnrEy56uD_3Q=s88-c-k-c0x00ffffff-no-rj'),
          ),
        ),
        Positioned(
          top: headerHeight / 1.5 -
              Theme.of(context).textTheme.labelLarge!.fontSize! -
              0.07 * headerHeight,
          left: leftMargin + 2 * imgWrapperRadius + 0.01 * headerWidth,
          child: SizedBox(
            width: headerWidth -
                (leftMargin +
                    2 * imgWrapperRadius +
                    0.01 * headerWidth) - //margin left to username
                0.02 * headerWidth, // margin right
            child: BlocBuilder<UserCubit, UserState>(
              buildWhen: (previous, current) =>
                  previous.username != current.username,
              builder: (context, state) {
                return Text(
                  state.username,
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
