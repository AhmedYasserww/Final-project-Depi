import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repos/course_repo.dart';
import 'reserve_lesson_state.dart';

class ReserveLessonCubit extends Cubit<ReserveLessonState> {
  final CourseRepo courseRepo;

  ReserveLessonCubit({required this.courseRepo}) : super(ReserveLessonInitial());

  Future<void> reserve(String lessonId) async {
    emit(ReserveLessonLoading(lessonId));
    try {
      final message = await courseRepo.reserveLesson(lessonId: lessonId);
      emit(ReserveLessonSuccess(lessonId, message));
    } catch (e) {
      emit(ReserveLessonError(lessonId, e.toString().replaceFirst('Exception: ', '')));
    }
  }
}