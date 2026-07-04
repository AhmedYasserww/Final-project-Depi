class BookedLessonEntity {
  final String lessonId;
  final String title;
  final String categoryName;
  final String teacherName;
  final DateTime bookedAt;

  const BookedLessonEntity({
    required this.lessonId,
    required this.title,
    required this.categoryName,
    required this.teacherName,
    required this.bookedAt,
  });
}