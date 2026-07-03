// core/di/service_locator.dart

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:kids_education_learning/feature/parent_auth/data/repos/category_repo_imp.dart';
import 'package:kids_education_learning/feature/parent_auth/data/repos/course_repo_imp.dart';
import 'package:kids_education_learning/feature/parent_auth/presentation/manager/category_cubit/category_cubit.dart';
import 'package:kids_education_learning/feature/parent_auth/presentation/manager/course_cubit/course_cubit.dart';
import 'package:kids_education_learning/feature/parent_auth/presentation/manager/parent_register/parent_register_cubit.dart';
import 'package:kids_education_learning/feature/parent_auth/presentation/manager/teacher_profile/teacher_profile_cubit.dart';

import '../../feature/parent_auth/data/repos/auth_repo_imp.dart';
import '../../feature/parent_auth/presentation/manager/log_in_cubit/login_cubit.dart';
import '../../feature/teacher/data/repos/teacher_repo_imp.dart';
import '../services/api_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(dio: Dio()));

  getIt.registerSingleton<AuthRepoImpl>(
    AuthRepoImpl(apiService: getIt.get<ApiService>()),
  );

  getIt.registerFactory<LoginCubit>(
    () => LoginCubit(getIt.get<AuthRepoImpl>()),
  );

  getIt.registerFactory<TeacherProfileCubit>(
    () => TeacherProfileCubit(authRepo: getIt.get<AuthRepoImpl>()),
  );

  //  ParentRegisterCubit
  getIt.registerFactory<ParentRegisterCubit>(
    () => ParentRegisterCubit(authRepo: getIt.get<AuthRepoImpl>()),
  );

  getIt.registerSingleton<CategoryRepoImpl>(
    CategoryRepoImpl(apiService: getIt<ApiService>()),
  );

  getIt.registerFactory<CategoryCubit>(
    () => CategoryCubit(getIt<CategoryRepoImpl>()),
  );
  getIt.registerLazySingleton<TeacherRepoImpl>(
    () => TeacherRepoImpl(apiService: getIt.get<ApiService>()),
  );

  getIt.registerLazySingleton<CourseRepoImpl>(
    () => CourseRepoImpl(apiService: getIt.get<ApiService>()),
  );

  getIt.registerFactory<CourseCubit>(
    () => CourseCubit(courseRepo: getIt.get<CourseRepoImpl>()),
  );
}
