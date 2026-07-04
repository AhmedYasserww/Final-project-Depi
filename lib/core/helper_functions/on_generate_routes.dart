import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kids_education_learning/core/service_locator/service_locator.dart';
import 'package:kids_education_learning/feature/bottom_nav_bar/presentation/views/parent_nav_bar_view.dart';
import 'package:kids_education_learning/feature/bottom_nav_bar/presentation/views/teacher_nav_bar_view.dart';
import 'package:kids_education_learning/feature/auth/presentaions/views/create_account_view.dart';
import 'package:kids_education_learning/feature/parent/presentations/views/home_view.dart';
import 'package:kids_education_learning/feature/teacher/presentations/views/widgets/lesson_video_played_view.dart';
import '../../feature/achievements/presentations/views/lesson_flow_view.dart';
import '../../feature/achievements/presentations/views/lessons_match_view.dart';
import '../../feature/auth/data/repos/auth_repo_imp.dart';
import '../../feature/auth/presentaions/auth_parent/presentaitions/views/add_child_name_view.dart';
import '../../feature/auth/presentaions/auth_parent/presentaitions/views/choose_activity_view.dart';
import '../../feature/auth/presentaions/auth_parent/presentaitions/views/choose_goal_view.dart';
import '../../feature/auth/presentaions/auth_teacher/presentations/manager/teacher_profile/teacher_profile_cubit.dart';
import '../../feature/auth/presentaions/auth_teacher/presentations/manager/teacher_register/teacher_register_cubit.dart';
import '../../feature/auth/presentaions/views/log_in_view.dart';
import '../../feature/bottom_nav_bar/presentation/views/bottom_nav_bar_view.dart';
import '../../feature/chat/presentation/views/inbox_chat_view.dart';
import '../../feature/splash/presentations/views/let_is_go_view.dart';
import '../../feature/parent/presentations/views/schedul_view.dart';
import '../../feature/parent/presentations/views/lessons_view.dart';
import '../../feature/auth/presentaions/auth_teacher/presentations/views/teacher_detailes_view.dart';
import '../../feature/parent/presentations/views/teacher_profile_parent_view.dart';
import '../../feature/teacher/presentations/views/teacher_schedule_view.dart';
import '../../feature/splash/presentations/views/splash_view.dart';
import '../next_update_version_widgets/widgets/shop_view.dart';

Route<dynamic> onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    // case SplashView.routeName:
    //   return MaterialPageRoute(builder: (context) => const SplashView());

    case LogInView.routeName:
      return MaterialPageRoute(builder: (context) => const LogInView());
    case AddChildNameView.routeName:
      return MaterialPageRoute(builder: (context) => const AddChildNameView());
    case CreateAccountView.routeName:
      return MaterialPageRoute(
        builder: (context) => BlocProvider(
          create: (context) =>
              TeacherRegisterCubit(authRepo: getIt.get<AuthRepoImpl>()),
          child: const CreateAccountView(),
        ),
      );
    case ChooseActivityView.routeName:
      return MaterialPageRoute(
        builder: (context) => const ChooseActivityView(),
      );
    case ChooseGoalView.routeName:
      return MaterialPageRoute(builder: (context) => const ChooseGoalView());
    case HomeView.routeName:
      return MaterialPageRoute(builder: (context) => const HomeView());
    case LessonsView.routeName:
      return MaterialPageRoute(builder: (context) => const LessonsView());
    case InboxChatView.routeName:
      return MaterialPageRoute(builder: (context) => const InboxChatView());
    case ShopView.routeName:
      return MaterialPageRoute(builder: (context) => const ShopView());
    case ScheduleView.routeName:
      return MaterialPageRoute(builder: (context) => const ScheduleView());
    case ParentNavBarView.routeName:
      return MaterialPageRoute(builder: (_) => const ParentNavBarView());
    case TeacherNavBarView.routeName:
      return MaterialPageRoute(builder: (_) => const TeacherNavBarView());
    case TeacherDetailsView.routeName:
      return MaterialPageRoute(
        builder: (context) => BlocProvider(
          create: (context) => getIt.get<TeacherProfileCubit>(),
          child: const TeacherDetailsView(),
        ),
      );
    case TeacherScheduleView.routeName:
      return MaterialPageRoute(
        builder: (context) => const TeacherScheduleView(),
      );
    case LessonFlowView.routeName:
      return MaterialPageRoute(builder: (context) => const LessonFlowView());
    case TeacherProfileParentView.routeName:
      final teacherId = settings.arguments as String;
      return MaterialPageRoute(
        builder: (_) => TeacherProfileParentView(teacherId: teacherId),
      );
      case SplashScreen.routeName:
      return MaterialPageRoute(builder: (context) => SplashScreen());

      case LessonVideoPlayerView.routeName:
  final args = settings.arguments as Map<String, String>;
  return MaterialPageRoute(
    builder: (_) => LessonVideoPlayerView(
      videoUrl: args['videoUrl']!,
      title: args['title']!,
    ),
  );

    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
