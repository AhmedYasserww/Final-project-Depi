class CourseEntity {
  final String id;
  final String title;
  final String description;
  final String teacherId;
  final int categoryId;
  final String lessonImageUrl;
  final String lessonVideoUrl;
  final String categoryName;
  final bool isCompleted;

  const CourseEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.teacherId,
    required this.categoryId,
    required this.lessonImageUrl,
    required this.lessonVideoUrl,
    required this.categoryName,
    required this.isCompleted,
  });
}