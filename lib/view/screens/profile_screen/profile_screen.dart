import 'package:flutter/material.dart';

import 'components/body_info.dart';
import 'components/profile_header.dart';
import 'components/weighing.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        ProfileHeader(),
        BodyInfo(),
        Weighing(),
      ],
    );
  }
}
