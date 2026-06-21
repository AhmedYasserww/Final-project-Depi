// feature/parent_auth/presentation/manager/parent_register/parent_register_cubit.dart

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kids_education_learning/core/helper_functions/save_user_data.dart';
import 'package:kids_education_learning/feature/parent_auth/data/repos/auth_repo.dart';
import 'package:kids_education_learning/feature/parent_auth/presentation/manager/parent_register/parent_register_state.dart';

class ParentRegisterCubit extends Cubit<ParentRegisterState> {
  final AuthRepo authRepo;

  ParentRegisterCubit({required this.authRepo}) : super(ParentRegisterInitial());

  Future<void> parentRegister({
    required String email,
    required String password,
    required String fullName,
  }) async {
    emit(ParentRegisterLoading());

    final result = await authRepo.parentRegister(
      email:    email,
      password: password,
      fullName: fullName,
    );

    if (result.isLeft()) {
      final failure = result.fold((f) => f, (_) => null)!;
      emit(ParentRegisterFailure(failure.errorMessage));
    } else {
      final entity = result.fold((_) => null, (e) => e)!;
      await UserPreferences.saveToken(entity.accessToken); // ✅ save first
      emit(ParentRegisterSuccess(entity));                 // ✅ emit after save
    }
  }
}