import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kids_education_learning/feature/teacher/data/entites/course_entity.dart';

import '../../../../../../core/utils/app_color.dart';
import '../../manager/reserve_lesson/reserve_lesson_cubit.dart';
import '../../manager/reserve_lesson/reserve_lesson_state.dart';

class LessonListTile extends StatelessWidget {
  final CourseEntity lesson;

  const LessonListTile({super.key, required this.lesson});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReserveLessonCubit, ReserveLessonState>(
      builder: (context, state) {
        final isLoadingThis =
            state is ReserveLessonLoading && state.lessonId == lesson.id;

        return Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFE0E0E0)),
          ),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(Icons.play_circle_fill, color: AppColors.primaryColor),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      lesson.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Inter',
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      lesson.categoryName,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontFamily: 'Inter',
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: isLoadingThis
                    ? null
                    : () => context.read<ReserveLessonCubit>().reserve(lesson.id),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                ),
                child: isLoadingThis
                    ? const SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const Text(
                        'Book',
                        style: TextStyle(fontWeight: FontWeight.w700, fontFamily: 'Inter'),
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}