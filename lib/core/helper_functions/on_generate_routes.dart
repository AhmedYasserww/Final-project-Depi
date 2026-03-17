import 'package:flutter/material.dart';
import 'package:kids_education_learning/feature/parent_auth/presentation/views/add_child_name_view.dart';
import 'package:kids_education_learning/feature/parent_auth/presentation/views/create_account_view.dart';
import 'package:kids_education_learning/feature/parent_auth/presentation/views/shop_view.dart';
import '../../feature/bottom_nav_bar/presentation/views/bottom_nav_bar_view.dart';
import '../../feature/parent_auth/presentation/views/choose_activity_view.dart';
import '../../feature/parent_auth/presentation/views/choose_goal_view.dart';
import '../../feature/parent_auth/presentation/views/inbox_chat_view.dart';
import '../../feature/parent_auth/presentation/views/schedul_view.dart';
import '../../feature/parent_auth/presentation/views/sign_up_view.dart';
import '../../feature/parent_auth/presentation/views/lessons_view.dart';
import '../../feature/parent_auth/presentation/views/teacher_detailes_view.dart';

Route<dynamic> onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    // case SplashView.routeName:
    //   return MaterialPageRoute(builder: (context) => const SplashView());

    case SignUpView.routeName:
      return MaterialPageRoute(builder: (context) => const SignUpView());
    case AddChildNameView.routeName:
      return MaterialPageRoute(builder: (context) => const AddChildNameView());
    case CreateAccountView.routeName:
      return MaterialPageRoute(builder: (context) => const CreateAccountView());
    case ChooseActivityView.routeName:
      return MaterialPageRoute(
        builder: (context) => const ChooseActivityView(),
      );
    case ChooseGoalView.routeName:
      return MaterialPageRoute(builder: (context) => const ChooseGoalView());
    case LessonsView.routeName:
      return MaterialPageRoute(builder: (context) => const LessonsView());
    case InboxChatView.routeName:
      return MaterialPageRoute(builder: (context) => const InboxChatView());
    case ShopView.routeName:
      return MaterialPageRoute(builder: (context) => const ShopView());
    case ScheduleView.routeName:
      return MaterialPageRoute(builder: (context) => const ScheduleView());
    case CustomNavigationBar.routeName:
      return MaterialPageRoute(
        builder: (context) => const CustomNavigationBar(),
      );
    case TeacherDetailsView.routeName:
      return MaterialPageRoute(
        builder: (context) => const TeacherDetailsView(),
      );

    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
