import 'package:flutter/material.dart';
import 'package:kids_education_learning/feature/bottom_nav_bar/presentation/nav_bar_item.dart';
import 'package:kids_education_learning/feature/parent_auth/presentation/views/profile_parent_view.dart';
import '../../../../core/utils/app_images.dart';
import '../../../parent_auth/presentation/views/home_view.dart';
import '../../../parent_auth/presentation/views/inbox_chat_view.dart';
import '../../../parent_auth/presentation/views/lessons_view.dart';
import '../../../parent_auth/presentation/views/schedul_view.dart';
import '../../../parent_auth/presentation/views/shop_view.dart';
import 'bottom_nav_bar_view.dart';

class ParentNavBarView extends StatelessWidget {
  const ParentNavBarView({super.key});
  static const String routeName = 'parent-nav-bar';

  @override
  Widget build(BuildContext context) {
    return CustomNavigationBar(items: [
      NavBarItem(title: "Home", outlinedIcon: AppImages.homeIcon, filledIcon: AppImages.homeFilled, screen: HomeView()),
      //NavBarItem(title: "Lessons", outlinedIcon: AppImages.lessonIcon, filledIcon: AppImages.productFilled, screen: LessonsView()),
      NavBarItem(title: "Schedule", outlinedIcon: AppImages.scheduleIcon, filledIcon: AppImages.cartFilled, screen: ScheduleView()),
      //NavBarItem(title: "Inbox", outlinedIcon: AppImages.inboxIcon, filledIcon: AppImages.moreIcon, screen: InboxChatView()),
      NavBarItem(title: "Profile", outlinedIcon: AppImages.profileIcon, filledIcon: AppImages.moreIcon, screen: ProfileParentView()),
    ]);
  }
}