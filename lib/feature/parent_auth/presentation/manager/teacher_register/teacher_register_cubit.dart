// cubit calls repo directly
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kids_education_learning/feature/parent_auth/data/repos/auth_repo.dart';
import 'package:kids_education_learning/feature/parent_auth/presentation/manager/teacher_register/teacher_register_state.dart';

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

    result.fold(
      (failure) => emit(TeacherRegisterFailure(failure.errorMessage)),
      (entity)  => emit(TeacherRegisterSuccess(entity)),
    );
  }
}