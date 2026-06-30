// features/auth/data/repos/auth_repo_impl.dart
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/faluire.dart';
import '../../../../core/services/api_service.dart';
import '../../../../core/services/end_points.dart';
import '../entites/log_in_entity.dart';
import '../models/log_in_model.dart';
import 'auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiService apiService;

  AuthRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, LoginEntity>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await apiService.post(
        endPoint: EndPoints.login,
        data: {
          "email": email,
          "password": password,
        },
      );

      log("🔐 Login Response: $response");

      if (response is Map<String, dynamic>) {
        final statusCode = response['statusCode'];
        final message = response['message'];

        if (statusCode == 200 &&
            response['succeeded'] == true &&
            response['data'] != null) {
          return right(LoginModel.fromJson(response['data']));
        } else {
          return left(ServerFailure(
            errorMessage: message ?? "Login failed",
          ));
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
}