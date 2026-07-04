import 'package:kids_education_learning/feature/teacher/data/entites/teacher_overview_entity.dart';

import 'lesson_model.dart';

class TeacherOverviewModel extends TeacherOverviewEntity {
  const TeacherOverviewModel({
    required super.lessonReserved,
    required super.lessonCompleted,
    required super.lessons,
    required super.location,
  });

  factory TeacherOverviewModel.fromJson(Map<String, dynamic> json) {
    return TeacherOverviewModel(
      lessonReserved: json['lessonReserved'] ?? 0,
      lessonCompleted: json['lessonCompleted'] ?? 0,
      lessons: (json['lessons'] as List<dynamic>? ?? [])
          .map((e) => LessonModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      location: json['location'] ?? '',
    );
  }
}