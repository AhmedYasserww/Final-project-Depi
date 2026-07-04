import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kids_education_learning/feature/parent/presentations/views/teacher_profile_parent_view_body.dart';

import '../../../../core/service_locator/service_locator.dart';
import '../../../../core/utils/app_color.dart';
import '../../../teacher/data/repos/teacher_repo_imp.dart';
import '../../../teacher/presentations/manager/get_teacher_profile_cubit/get_teacher_profile_cubit.dart';

class TeacherProfileParentView extends StatelessWidget {
  const TeacherProfileParentView({super.key, required this.teacherId});

  final String teacherId;

  static const String routeName = "teacher_profile_parent_view";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetTeacherProfileCubit(
        teacherRepo: getIt.get<TeacherRepoImpl>(),
      )..getTeacherProfile(id: teacherId),
      child: const Scaffold(
        backgroundColor: AppColors.backGroundColor,
        body: TeacherProfileParentViewBody(),
      ),
    );
  }
}