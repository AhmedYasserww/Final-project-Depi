import 'package:kids_education_learning/feature/parent_auth/data/entites/course_entity.dart';


abstract class ScheduleLessonState {}

class ScheduleLessonInitial extends ScheduleLessonState {}

class ScheduleLessonLoading extends ScheduleLessonState {}

class ScheduleLessonSuccess extends ScheduleLessonState {
  final List<CourseEntity> lessons;
  ScheduleLessonSuccess(this.lessons);
}

class ScheduleLessonError extends ScheduleLessonState {
  final String message;
  ScheduleLessonError(this.message);
}