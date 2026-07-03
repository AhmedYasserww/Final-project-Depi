
import 'package:kids_education_learning/feature/parent_auth/data/entites/course_entity.dart';

class CourseModel extends CourseEntity {
  const CourseModel({
    required super.id,
    required super.title,
    required super.description,
    required super.teacherId,
    required super.categoryId,
    required super.lessonVideoUrl,
    required super.categoryName,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      id: json['id']?.toString() ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      teacherId: json['teacherId']?.toString() ?? '',
      categoryId: json['categoryId'] is int
          ? json['categoryId']
          : int.tryParse(json['categoryId'].toString()) ?? 0,
      lessonVideoUrl: json['lessonVideoUrl'] ?? '',
      categoryName: json['categoryName'] ?? '',
    );
  }
}