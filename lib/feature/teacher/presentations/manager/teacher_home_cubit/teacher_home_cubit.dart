import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kids_education_learning/feature/teacher/data/entites/teacher_overview_entity.dart';
import 'package:kids_education_learning/feature/teacher/data/repos/teacher_home_repo.dart';

part 'teacher_home_state.dart';

class TeacherHomeCubit extends Cubit<TeacherHomeState> {
  final TeacherHomeRepo teacherHomeRepo;

  TeacherHomeCubit({required this.teacherHomeRepo}) : super(TeacherHomeInitial());

  Future<void> getTeacherOverview() async {
    emit(TeacherHomeLoading());
    final result = await teacherHomeRepo.getTeacherOverview();
    result.fold(
      (failure) => emit(TeacherHomeFailure(errMessage: failure.errorMessage)),
      (overview) => emit(TeacherHomeSuccess(overview: overview)),
    );
  }
}