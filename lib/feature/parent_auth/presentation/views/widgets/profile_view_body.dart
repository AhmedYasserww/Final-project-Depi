import 'package:flutter/material.dart';
import 'package:kids_education_learning/core/widgets/custom_add_child.dart';
import '../../../../../core/utils/app_dimensions.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/widgets/custom_achivement_card.dart';
import '../../../../../core/widgets/custom_free_plan_card.dart';
import '../../../../../core/widgets/custom_personal_info.dart';
import '../../../../../core/widgets/custom_profile_image.dart';
import '../../../../../core/widgets/custom_subtitle_text_in_screen.dart';
import '../../../../../core/widgets/custom_switch_profile.dart';
import '../../../../../core/widgets/custom_title_text_in_screen.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.authScreenPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 32),
                CustomTitleText(text: 'Profile'),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomSwitchProfile(
                      title: "Profile",
                      isActive: true,
                      onTap: () {},
                    ),

                    const SizedBox(width: 10),

                    CustomSwitchProfile(
                      title: "Settings",
                      isActive: false,
                      onTap: () {},
                    ),
                  ],
                ),
                SizedBox(height: 24),
                const CircularProfileImage(imagePath: AppImages.profilePhoto),
                const SizedBox(height: 16),
                CustomTitleText(text: 'Sarah East', fontSize: 20),
                SizedBox(height: 4),
                CustomSubtitleText(text: 'sarah_east@gmail.com', fontSize: 16),
                SizedBox(height: 16),
                CustomFreePlanCard(onShopTap: () {}),
                SizedBox(height: 16),
                CustomAchievementCard(current: 5, total: 100, onTap: () {}),
                SizedBox(height: 48),
                CustomTitleText(text: 'Personal details', fontSize: 20),
                SizedBox(height: 24),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PersonalInfoTile(
                      label: 'Name',
                      value: 'Sarah East',
                      onEditPressed: () {},
                    ),
                    SizedBox(height: 24),
                    Divider(),
                    SizedBox(height: 24),
                    PersonalInfoTile(
                      label: 'Email address',
                      value: 'sarah_east@gmail.com',
                      onEditPressed: () {},
                    ),
                    SizedBox(height: 24),
                    Divider(),
                    SizedBox(height: 24),
                    PersonalInfoTile(
                      label: 'Password',
                      value: 'your_password_here',
                      isPassword: true,
                      onEditPressed: () {},
                      showDivider: false,
                    ),
                  ],
                ),
                SizedBox(height: 48),
                CustomAddChild(maxChildren: 2, onAddChild: () {}),
                SizedBox(height: 24),
                PersonalInfoTile(
                  label: 'Name',
                  value: 'Jacob',
                  onEditPressed: () {},
                  showDivider: false,
                ),
                SizedBox(height: 48),
                Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
