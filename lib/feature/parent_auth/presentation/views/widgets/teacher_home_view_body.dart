import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kids_education_learning/core/service_locator/service_locator.dart';
import 'package:kids_education_learning/core/utils/app_color.dart';
import 'package:kids_education_learning/core/utils/app_style.dart';
import 'package:kids_education_learning/core/widgets/custom_lesson_card_father.dart';
import 'package:kids_education_learning/core/widgets/custom_stat_card_father.dart';
import 'package:kids_education_learning/feature/teacher/presentations/manager/teacher_home_cubit/teacher_home_cubit.dart';

class TeacherHomeViewBody extends StatelessWidget {
  const TeacherHomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<TeacherHomeCubit>()..getTeacherOverview(),
      child: Scaffold(
        backgroundColor: AppColors.backGroundColor,
        body: SafeArea(
          child: BlocBuilder<TeacherHomeCubit, TeacherHomeState>(
            builder: (context, state) {
              if (state is TeacherHomeLoading || state is TeacherHomeInitial) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is TeacherHomeFailure) {
                return Center(child: Text(state.errMessage));
              }

              final overview = (state as TeacherHomeSuccess).overview;

              return SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Overview',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w700,
                            color: AppColors.darkBlueColor,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: AppColors.borderColor,
                              width: 1.2,
                            ),
                          ),
                          child: const Icon(
                            Icons.notifications,
                            color: AppColors.darkBlueColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    IntrinsicHeight(
                      child: Row(
                        children: [
                          Expanded(
                            child: StatCard(
                              value: overview.lessonCompleted.toString(),
                              label: 'Lesson completed',
                              icon: Container(
                                padding: const EdgeInsets.all(2),
                                decoration: const BoxDecoration(
                                  color: Color(0xFF4CAF50),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 16,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: StatCard(
                              value: overview.lessonReserved.toString(),
                              label: 'Scheduled lessons',
                              icon: const Icon(
                                Icons.calendar_today_outlined,
                                color: AppColors.darkBlueColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                    Text(
                      'Scheduled Lessons',
                      style: AppStyle.styleBold20.copyWith(
                        fontSize: 22,
                        color: AppColors.darkBlueColor,
                      ),
                    ),
                    const SizedBox(height: 16),
                    if (overview.lessons.isEmpty)
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 24),
                        child: Text('No scheduled lessons yet'),
                      )
                    else ...[
                      const SectionLabel(label: 'Today'),
                      const SizedBox(height: 8),
                      ...overview.lessons.map(
                        (lesson) => Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: CustomLessonCardParent(
                            name: lesson.title,
                            mode: lesson.categoryName,
                            category: lesson.categoryName,
                          ),
                        ),
                      ),
                    ],
                    const SizedBox(height: 24),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class SectionLabel extends StatelessWidget {
  final String label;
  const SectionLabel({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(label, style: AppStyle.styleGreyMedium14);
  }
}