import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kids_education_learning/feature/parent_auth/data/repos/course_repo.dart';
import 'course_state.dart';

class CourseCubit extends Cubit<CourseState> {
  final CourseRepo courseRepo;

  CourseCubit({required this.courseRepo}) : super(CourseInitial());

  Future<void> addCourse({
    required String title,
    required String description,
    required int categoryId,
    required String videoPath,
    required String videoName,
  }) async {
    emit(CourseLoading());
    try {
      final course = await courseRepo.addCourse(
        title: title,
        description: description,
        categoryId: categoryId,
        videoPath: videoPath,
        videoName: videoName,
      );
      emit(CourseSuccess(course));
    } catch (e) {
      emit(CourseError(e.toString().replaceFirst('Exception: ', '')));
    }
  }
}