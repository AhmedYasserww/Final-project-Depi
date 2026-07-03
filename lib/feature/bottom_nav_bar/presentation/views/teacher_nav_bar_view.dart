import 'package:flutter/material.dart';
import 'package:kids_education_learning/feature/bottom_nav_bar/presentation/nav_bar_item.dart';
import 'package:kids_education_learning/feature/parent_auth/presentation/views/inbox_chat_view.dart';
import 'package:kids_education_learning/feature/parent_auth/presentation/views/teacher_profile_view.dart';
import '../../../../core/utils/app_images.dart';
import '../../../parent_auth/presentation/views/teacher_home_view.dart';
import 'bottom_nav_bar_view.dart';

class TeacherNavBarView extends StatelessWidget {
  const TeacherNavBarView({super.key});
  static const String routeName = 'teacher-nav-bar';

  @override
  Widget build(BuildContext context) {
    return CustomNavigationBar(
      items: [
        NavBarItem(
          title: "Home",
          outlinedIcon: AppImages.homeIcon,
          filledIcon: AppImages.homeFilled,
          screen: TeacherHomeView(),
        ),
        // NavBarItem(
        //   title: "Inbox",
        //   outlinedIcon: AppImages.inboxIcon,
        //   filledIcon: AppImages.moreIcon,
        //   screen: const InboxChatView(),
        // ),
        NavBarItem(
          title: "Profile",
          outlinedIcon: AppImages.profileIcon,
          filledIcon: AppImages.profileIcon,
          screen: const TeacherProfileView(),
        ),
      ],
    );
  }
}
