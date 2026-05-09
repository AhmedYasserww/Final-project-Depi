import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:kids_education_learning/feature/parent_auth/presentation/manager/teacher_profile/teacher_profile_cubit.dart';

import '../../feature/parent_auth/data/repos/auth_repo_imp.dart';
import '../../feature/parent_auth/presentation/manager/log_in_cubit/login_cubit.dart';
import '../services/api_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(dio: Dio()));
  getIt.registerSingleton<AuthRepoImpl>(AuthRepoImpl(apiService:getIt.get<ApiService>(),));
  getIt.registerFactory<LoginCubit>(
        () => LoginCubit(getIt.get<AuthRepoImpl>()),
  );
   getIt.registerFactory<TeacherProfileCubit>(
    () => TeacherProfileCubit(
      authRepo: getIt.get<AuthRepoImpl>(),
    ),
  );
}

