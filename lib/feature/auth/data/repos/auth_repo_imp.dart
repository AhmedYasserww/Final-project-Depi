
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:kids_education_learning/feature/auth/presentaions/auth_parent/data/entities/parent_register_entity.dart';
import 'package:kids_education_learning/feature/teacher/data/entites/teacher_profile_entity.dart';
import 'package:kids_education_learning/feature/auth/presentaions/auth_parent/data/models/parent_register_model.dart';

import '../../../../core/errors/faluire.dart';
import '../../../../core/services/api_service.dart';
import '../../../../core/services/end_points.dart';
import '../../../auth/data/entities/log_in_entity.dart';
import '../../../auth/data/models/log_in_model.dart';
import '../../../auth/data/repos/auth_repo.dart';
import '../../../teacher/data/models/teacher_profile_model.dart';
import '../../presentaions/auth_teacher/data/models/teacher_register_model.dart';
import '../../presentaions/auth_teacher/presentations/manager/teacher_register_entity.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiService apiService;

  AuthRepoImpl({required this.apiService});

  // ─────────────────────────────── LOGIN ───────────────────────────────────
  @override
  Future<Either<Failure, LoginEntity>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await apiService.post(
        endPoint: EndPoints.login,
        data: {"email": email, "password": password},
      );

      log("🔐 Login Response: $response");

      if (response is Map<String, dynamic>) {
        final message = response['message'];
        if (response['succeeded'] == true && response['data'] != null) {
          return right(LoginModel.fromJson(response['data']));
        } else {
          return left(ServerFailure(errorMessage: message ?? "Login failed"));
        }
      } else {
        return left(ServerFailure(errorMessage: "Unexpected response format"));
      }
    } on DioException catch (e) {
      log('❌ DioException (Login): ${e.message}');
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      log('❌ Unexpected Error (Login): $e');
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  // ──────────────────────────── TEACHER REGISTER ───────────────────────────
  @override
  Future<Either<Failure, TeacherRegisterEntity>> teacherRegister({
    required String email,
    required String password,
    required String fullName,
  }) async {
    try {
      final formData = FormData.fromMap({
        "Email":    email,
        "Password": password,
        "FullName": fullName,
      });

      final response = await apiService.postMultipart(
        endPoint: EndPoints.teacherRegister,
        data: formData,
      );

      log("📝 Teacher Register Response: $response");

      if (response is Map<String, dynamic>) {
        final message   = response['message'];
        final succeeded = response['succeeded'];
        final data      = response['data'];

        if (succeeded == true) {
          if (data != null) {
            return right(TeacherRegisterModel.fromJson(data));
          } else {
            log("⚠️ No data returned, attempting auto-login...");
            return await login(email: email, password: password).then(
                  (loginResult) => loginResult.fold(
                    (failure) => left(failure),
                    (loginEntity) => right(
                  TeacherRegisterModel.fromJson({
                    "id":                loginEntity.id,
                    "email":             loginEntity.email,
                    "fullName":          fullName,
                    "registrationPhase": 0,
                    "role":              loginEntity.role,
                    "bio":               "",
                    "country":           "",
                    "hourlyRate":        0,
                    "accessToken":       loginEntity.accessToken,
                    "refreshToken":      loginEntity.refreshToken,
                  }),
                ),
              ),
            );
          }
        } else {
          return left(ServerFailure(errorMessage: message ?? "Registration failed"));
        }
      } else {
        return left(ServerFailure(errorMessage: "Unexpected response format"));
      }
    } on DioException catch (e) {
      log('❌ DioException (TeacherRegister): ${e.message}');
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      log('❌ Unexpected Error (TeacherRegister): $e');
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  // ──────────────────────────── UPDATE TEACHER PROFILE ─────────────────────
  @override
  Future<Either<Failure, TeacherProfileEntity>> updateTeacherProfile({
    required String country,
    required double hourlyRate,
    required String bio,
    String? imagePath,
  }) async {
    try {
      final formData = FormData.fromMap({
        "Country":    country,
        "HourlyRate": hourlyRate,
        "Bio":        bio,
        if (imagePath != null)
          "ProfileImage": await MultipartFile.fromFile(imagePath),
      });

      final response = await apiService.putMultipart(
        endPoint: EndPoints.teacherProfile,
        data: formData,
      );

      log("👤 Update Teacher Profile Response: $response");

      if (response is Map<String, dynamic>) {
        final message   = response['message'];
        final succeeded = response['succeeded'];

        if (succeeded == true && response['data'] != null) {
          return right(TeacherProfileModel.fromJson(response['data']));
        } else {
          return left(ServerFailure(errorMessage: message ?? "Update failed"));
        }
      } else {
        return left(ServerFailure(errorMessage: "Unexpected response format"));
      }
    } on DioException catch (e) {
      log('❌ DioException (UpdateTeacherProfile): ${e.message}');
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      log('❌ Unexpected Error (UpdateTeacherProfile): $e');
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  // ──────────────────────────── GET TEACHER PROFILE ────────────────────────
  @override
  Future<Either<Failure, TeacherProfileEntity>> getTeacherProfile() async {
    try {
      final response = await apiService.get(
        endPoint: EndPoints.teacherProfile,
      );

      log("👤 Get Teacher Profile Response: $response");

      if (response is Map<String, dynamic>) {
        final message   = response['message'];
        final succeeded = response['succeeded'];
        final data      = response['data'];

        if (succeeded == true && data != null) {
          return right(TeacherProfileModel.fromJson(data));
        } else if (succeeded == null && response['id'] != null) {
          // في حالة الـ API بيرجع الأوبجكت مباشرة من غير wrapper
          return right(TeacherProfileModel.fromJson(response));
        } else {
          return left(
            ServerFailure(errorMessage: message ?? "Failed to load profile"),
          );
        }
      } else {
        return left(ServerFailure(errorMessage: "Unexpected response format"));
      }
    } on DioException catch (e) {
      log('❌ DioException (GetTeacherProfile): ${e.message}');
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      log('❌ Unexpected Error (GetTeacherProfile): $e');
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  // ──────────────────────────── PARENT REGISTER ────────────────────────────
  @override
  Future<Either<Failure, ParentRegisterEntity>> parentRegister({
    required String email,
    required String password,
    required String fullName,
  }) async {
    try {
      final formData = FormData.fromMap({
        "Email":    email,
        "Password": password,
        "FullName": fullName,
      });

      final response = await apiService.postMultipart(
        endPoint: EndPoints.parentRegister,
        data: formData,
      );

      log("👨‍👧 Parent Register Response: $response");

      if (response is Map<String, dynamic>) {
        final message   = response['message'];
        final succeeded = response['succeeded'];
        final data      = response['data'];

        if (succeeded == true && data != null) {
          return right(ParentRegisterModel.fromJson(data));
        } else {
          return left(
            ServerFailure(errorMessage: message ?? "Parent registration failed"),
          );
        }
      } else {
        return left(ServerFailure(errorMessage: "Unexpected response format"));
      }
    } on DioException catch (e) {
      log('❌ DioException (ParentRegister): ${e.message}');
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      log('❌ Unexpected Error (ParentRegister): $e');
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}