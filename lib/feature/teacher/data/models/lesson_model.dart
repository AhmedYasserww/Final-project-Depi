
import 'package:kids_education_learning/feature/teacher/data/entites/lesson_entity.dart';

class LessonModel extends LessonEntity {
  const LessonModel({
    required super.id,
    required super.title,
    required super.description,
    required super.teacherId,
    required super.categoryId,
    required super.lessonVideoUrl,
    required super.categoryName,
  });

  factory LessonModel.fromJson(Map<String, dynamic> json) {
    return LessonModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      teacherId: json['teacherId'] ?? '',
      categoryId: json['categoryId'] ?? 0,
      lessonVideoUrl: json['lessonVideoUrl'] ?? '',
      categoryName: json['categoryName'] ?? '',
    );
  }
}