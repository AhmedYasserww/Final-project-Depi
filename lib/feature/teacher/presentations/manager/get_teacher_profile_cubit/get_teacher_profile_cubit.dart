import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repos/teacher_repo.dart';
import 'get_teacher_profile_state.dart';

class GetTeacherProfileCubit extends Cubit<GetTeacherProfileState> {
  GetTeacherProfileCubit({required this.teacherRepo})
      : super(GetTeacherProfileInitial());

  final TeacherRepo teacherRepo;

  Future<void> getTeacherProfile({required String id}) async {
    emit(GetTeacherProfileLoading());
    try {
      final teacher = await teacherRepo.getTeacherProfile(id: id);
      emit(GetTeacherProfileSuccess(teacher));
    } catch (e) {
      emit(
        GetTeacherProfileFailure(e.toString().replaceFirst('Exception: ', '')),
      );
    }
  }
}