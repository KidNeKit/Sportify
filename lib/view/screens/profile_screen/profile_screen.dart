import 'package:flutter/material.dart';
import 'package:sportify/view/screens/profile_screen/components/body_info.dart';
import 'package:sportify/view/screens/profile_screen/components/profile_header.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        ProfileHeader(),
        BodyInfo(),
      ],
    );
  }
}
