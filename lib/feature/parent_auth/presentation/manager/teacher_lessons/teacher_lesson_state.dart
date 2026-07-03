import 'package:kids_education_learning/feature/parent_auth/data/entites/course_entity.dart';

abstract class TeacherLessonsState {}

class TeacherLessonsInitial extends TeacherLessonsState {}

class TeacherLessonsLoading extends TeacherLessonsState {}

class TeacherLessonsSuccess extends TeacherLessonsState {
  final List<CourseEntity> lessons;
  TeacherLessonsSuccess(this.lessons);
}

class TeacherLessonsError extends TeacherLessonsState {
  final String message;
  TeacherLessonsError(this.message);
}