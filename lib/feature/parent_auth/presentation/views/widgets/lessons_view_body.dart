import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kids_education_learning/core/service_locator/service_locator.dart';
import 'package:kids_education_learning/core/utils/app_dimensions.dart';
import 'package:kids_education_learning/core/utils/app_style.dart';
import 'package:kids_education_learning/core/widgets/custom_text_field.dart';
import 'package:kids_education_learning/core/widgets/custome_lessons_card.dart';
import 'package:kids_education_learning/feature/parent_auth/presentation/manager/schedule_lesson/schedule_lesson_cubit.dart';
import 'package:kids_education_learning/feature/parent_auth/presentation/manager/schedule_lesson/schedule_lesson_state.dart';

class LessonsViewBody extends StatelessWidget {
  const LessonsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ScheduleLessonCubit>()..getScheduledLessons(),
      child: const _LessonsViewContent(),
    );
  }
}

class _LessonsViewContent extends StatelessWidget {
  const _LessonsViewContent();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: AppDimensions.lessonScreenPadding,
            top: AppDimensions.lessonScreenTopPadding,
            right: AppDimensions.lessonScreenPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Lessons", style: AppStyle.styleBold32),
              const SizedBox(height: 8),
              const Text(
                "Keep track of your current and completed lessons.",
                style: AppStyle.styleGreyRegular16,
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 36,
                      child: CustomTextField(
                        prefixIcon: Image.asset("assets/icons/search_icon.jpg"),
                        hintText: "Search",
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {},
                    child: SvgPicture.asset("assets/icons/filter_icon.svg"),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              BlocBuilder<ScheduleLessonCubit, ScheduleLessonState>(
                builder: (context, state) {
                  if (state is ScheduleLessonLoading || state is ScheduleLessonInitial) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 40),
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }
                  if (state is ScheduleLessonError) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(state.message, style: AppStyle.styleGreyRegular16),
                    );
                  }
                  if (state is ScheduleLessonSuccess) {
                    if (state.lessons.isEmpty) {
                      return const Padding(
                        padding: EdgeInsets.symmetric(vertical: 40),
                        child: Center(
                          child: Text(
                            "You don't have any lessons yet.",
                            style: AppStyle.styleGreyRegular16,
                          ),
                        ),
                      );
                    }
                    return Column(
                      children: state.lessons.map((lesson) {
                        return CustomeLessonsCard(
                          childName: "Your Child",
                          state: lesson.isCompleted ? "Completed" : "Active",
                          instructorName: "Fares",
                          date: "",
                          category: lesson.categoryName,
                          videoUrl: lesson.lessonVideoUrl,
                        );
                      }).toList(),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}