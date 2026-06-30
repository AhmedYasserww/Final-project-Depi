// features/auth/presentation/manager/login_cubit/login_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:kids_education_learning/core/helper_functions/save_user_data.dart';
import 'package:meta/meta.dart';
import '../../../data/entites/log_in_entity.dart';
import '../../../data/repos/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepo authRepo;

  LoginCubit(this.authRepo) : super(LoginInitial());

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());

    final result = await authRepo.login(email: email, password: password);

    if (result.isLeft()) {
      final failure = result.fold((f) => f, (_) => null)!;
      emit(LoginFailure(errorMessage: failure.errorMessage));
    } else {
      final entity = result.fold((_) => null, (e) => e)!;
      await UserPreferences.saveToken(entity.accessToken); // ✅ properly awaited
      emit(LoginSuccess(loginEntity: entity)); // ✅ emits after save
    }
  }
}
