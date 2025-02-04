import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tourista/features/profile/presentation/views/widgets/setting_section.dart';
import 'widgets/circle_avatar_with_user_name.dart';
import 'widgets/general_section.dart';
import 'widgets/help_and_support_section.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatarWithUserName(
              screenWidth: screenWidth, screenheight: screenheight),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GeneralSection(),
                Gap(20),
                HelpAndSupportSection(),
                Gap(20),
                SettingSection()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
