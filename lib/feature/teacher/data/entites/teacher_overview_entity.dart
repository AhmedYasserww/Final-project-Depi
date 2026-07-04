import 'lesson_entity.dart';

class TeacherOverviewEntity {
  final int lessonReserved;
  final int lessonCompleted;
  final List<LessonEntity> lessons;
  final String location;

  const TeacherOverviewEntity({
    required this.lessonReserved,
    required this.lessonCompleted,
    required this.lessons,
    required this.location,
  });
}