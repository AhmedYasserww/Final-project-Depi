import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repos/course_repo.dart';
import 'schedule_lesson_state.dart';

class ScheduleLessonCubit extends Cubit<ScheduleLessonState> {
  final CourseRepo courseRepo;

  ScheduleLessonCubit({required this.courseRepo}) : super(ScheduleLessonInitial());

  Future<void> getScheduledLessons() async {
    emit(ScheduleLessonLoading());
    try {
      final lessons = await courseRepo.getParentLessons();
      emit(ScheduleLessonSuccess(lessons));
    } catch (e) {
      emit(ScheduleLessonError(e.toString().replaceFirst('Exception: ', '')));
    }
  }
}