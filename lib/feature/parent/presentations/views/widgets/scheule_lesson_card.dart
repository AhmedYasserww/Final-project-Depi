import 'package:flutter/material.dart';
import 'package:kids_education_learning/feature/teacher/data/entites/course_entity.dart';

import '../../../../../../core/utils/app_color.dart';

class ScheduledLessonCard extends StatelessWidget {
  final CourseEntity lesson;

  const ScheduledLessonCard({super.key, required this.lesson});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE0E0E0)),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: lesson.lessonImageUrl.isNotEmpty
                ? Image.network(
                    lesson.lessonImageUrl,
                    width: 48,
                    height: 48,
                    fit: BoxFit.cover,
                  )
                : Container(
                    width: 48,
                    height: 48,
                    color: AppColors.primaryColor.withOpacity(0.1),
                    child: Icon(Icons.play_circle_fill, color: AppColors.primaryColor),
                  ),
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
                  style: const TextStyle(fontWeight: FontWeight.w700, fontFamily: 'Inter'),
                ),
                const SizedBox(height: 2),
                Text(
                  lesson.categoryName,
                  style: TextStyle(color: Colors.grey.shade600, fontFamily: 'Inter', fontSize: 13),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: lesson.isCompleted ? Colors.green.shade50 : Colors.orange.shade50,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              lesson.isCompleted ? 'Completed' : 'Upcoming',
              style: TextStyle(
                color: lesson.isCompleted ? Colors.green.shade700 : Colors.orange.shade700,
                fontWeight: FontWeight.w600,
                fontSize: 12,
                fontFamily: 'Inter',
              ),
            ),
          ),
        ],
      ),
    );
  }
}