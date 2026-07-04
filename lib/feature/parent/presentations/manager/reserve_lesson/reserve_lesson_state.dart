abstract class ReserveLessonState {}

class ReserveLessonInitial extends ReserveLessonState {}

/// Tracks which lesson is currently being reserved so only that
/// tile's button shows a spinner, not all of them.
class ReserveLessonLoading extends ReserveLessonState {
  final String lessonId;
  ReserveLessonLoading(this.lessonId);
}

class ReserveLessonSuccess extends ReserveLessonState {
  final String lessonId;
  final String message;
  ReserveLessonSuccess(this.lessonId, this.message);
}

class ReserveLessonError extends ReserveLessonState {
  final String lessonId;
  final String message;
  ReserveLessonError(this.lessonId, this.message);
}