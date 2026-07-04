import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kids_education_learning/core/helper_functions/save_user_data.dart';
import 'package:kids_education_learning/feature/auth/data/repos/auth_repo.dart';
import 'package:kids_education_learning/feature/auth/presentaions/auth_teacher/presentations/manager/teacher_register/teacher_register_state.dart';

class TeacherRegisterCubit extends Cubit<TeacherRegisterState> {
  final AuthRepo authRepo;

  TeacherRegisterCubit({required this.authRepo}) : super(TeacherRegisterInitial());

  Future<void> teacherRegister({
    required String email,
    required String password,
    required String fullName,
  }) async {
    emit(TeacherRegisterLoading());

    final result = await authRepo.teacherRegister(
      email: email,
      password: password,
      fullName: fullName,
    );

    if (result.isLeft()) {
      final failure = result.fold((f) => f, (_) => null)!;
      emit(TeacherRegisterFailure(failure.errorMessage));
    } else {
      final entity = result.fold((_) => null, (e) => e)!;
      await UserPreferences.saveToken(entity.accessToken);
      emit(TeacherRegisterSuccess(entity));
    }
  }
}