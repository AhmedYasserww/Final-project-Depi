// features/auth/presentation/manager/login_cubit/login_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../data/entites/log_in_entity.dart';
import '../../../data/repos/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepo authRepo;

  LoginCubit(this.authRepo) : super(LoginInitial());

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());
    final result = await authRepo.login(email: email, password: password);
    result.fold(
          (failure) => emit(LoginFailure(errorMessage: failure.errorMessage)),
          (loginEntity) => emit(LoginSuccess(loginEntity: loginEntity)),
    );
  }
}