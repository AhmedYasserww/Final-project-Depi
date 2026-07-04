class LessonEntity {
  final String id;
  final String title;
  final String description;
  final String teacherId;
  final int categoryId;
  final String lessonVideoUrl;
  final String categoryName;

  const LessonEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.teacherId,
    required this.categoryId,
    required this.lessonVideoUrl,
    required this.categoryName,
  });
}