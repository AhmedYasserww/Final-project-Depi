import 'package:kids_education_learning/feature/teacher/data/entites/course_entity.dart';

abstract class CourseState {}

class CourseInitial extends CourseState {}

class CourseLoading extends CourseState {}

class CourseSuccess extends CourseState {
  final CourseEntity course;
  CourseSuccess(this.course);
}

class CourseError extends CourseState {
  final String message;
  CourseError(this.message);
}