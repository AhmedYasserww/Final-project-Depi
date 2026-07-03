import 'package:kids_education_learning/feature/parent_auth/data/entites/course_entity.dart';


abstract class CourseRepo {
  Future<CourseEntity> addCourse({
    required String title,
    required String description,
    required int categoryId,
    required String videoPath,
    required String videoName,
  });
}