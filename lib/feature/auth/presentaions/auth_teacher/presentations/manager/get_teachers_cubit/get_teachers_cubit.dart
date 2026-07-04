import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../teacher/data/repos/teacher_repo.dart';
import 'get_teachers_state.dart';

class GetTeachersCubit extends Cubit<GetTeachersState> {
  GetTeachersCubit({required this.teacherRepo}) : super(GetTeachersInitial());

  final TeacherRepo teacherRepo;

  Future<void> getTeachers() async {
    emit(GetTeachersLoading());
    try {
      final teachers = await teacherRepo.getTeachers();
      emit(GetTeachersSuccess(teachers));
    } catch (e) {
      emit(GetTeachersFailure(e.toString().replaceFirst('Exception: ', '')));
    }
  }
}