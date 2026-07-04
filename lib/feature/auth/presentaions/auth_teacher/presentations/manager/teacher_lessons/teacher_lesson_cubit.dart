import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kids_education_learning/feature/auth/presentaions/auth_teacher/presentations/manager/teacher_lessons/teacher_lesson_state.dart';


import '../../../../../../parent/data/repos/course_repo.dart';


class TeacherLessonsCubit extends Cubit<TeacherLessonsState> {
  final CourseRepo courseRepo;

  TeacherLessonsCubit({required this.courseRepo}) : super(TeacherLessonsInitial());

  Future<void> getTeacherLessons(String teacherId) async {
    emit(TeacherLessonsLoading());
    try {
      final lessons = await courseRepo.getTeacherLessons(teacherId: teacherId);
      emit(TeacherLessonsSuccess(lessons));
    } catch (e) {
      emit(TeacherLessonsError(e.toString().replaceFirst('Exception: ', '')));
    }
  }
}