import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kids_education_learning/core/service_locator/service_locator.dart';
import 'package:kids_education_learning/core/utils/app_color.dart';
import 'package:kids_education_learning/core/utils/app_style.dart';
import 'package:kids_education_learning/feature/parent/presentations/views/widgets/lesson_reserved_dialog.dart';

import '../../../../auth/presentaions/auth_teacher/presentations/manager/teacher_lessons/teacher_lesson_cubit.dart';
import '../../../../auth/presentaions/auth_teacher/presentations/manager/teacher_lessons/teacher_lesson_state.dart';
import '../../../../parent/presentations/manager/reserve_lesson/reserve_lesson_cubit.dart';
import '../../../../parent/presentations/manager/reserve_lesson/reserve_lesson_state.dart';
import '../../../../parent/presentations/views/widgets/lesson_list_tile.dart';

class TeacherLessonsView extends StatelessWidget {
  final String teacherId;
  final String teacherName;

  const TeacherLessonsView({
    super.key,
    required this.teacherId,
    required this.teacherName,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<TeacherLessonsCubit>()..getTeacherLessons(teacherId),
        ),
        BlocProvider(create: (_) => getIt<ReserveLessonCubit>()),
      ],
      child: Scaffold(
        backgroundColor: AppColors.backGroundColor,
        appBar: AppBar(
          backgroundColor: AppColors.backGroundColor,
          elevation: 0,
          title: Text('$teacherName\'s Courses', style: AppStyle.styleBold20),
          iconTheme: const IconThemeData(color: AppColors.blackColor),
        ),
        body: BlocListener<ReserveLessonCubit, ReserveLessonState>(
          listener: (context, state) async {
            if (state is ReserveLessonSuccess) {
              await showDialog(
                context: context,
                barrierDismissible: false,
                builder: (_) => const LessonReservedDialog(),
              );
            } else if (state is ReserveLessonError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          },
          child: BlocBuilder<TeacherLessonsCubit, TeacherLessonsState>(
            builder: (context, state) {
              if (state is TeacherLessonsLoading || state is TeacherLessonsInitial) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is TeacherLessonsError) {
                return Center(child: Text(state.message));
              }
              if (state is TeacherLessonsSuccess) {
                if (state.lessons.isEmpty) {
                  return const Center(child: Text('This teacher has no courses yet.'));
                }
                return ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: state.lessons.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) => LessonListTile(lesson: state.lessons[index]),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}