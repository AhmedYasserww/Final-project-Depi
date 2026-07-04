import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:kids_education_learning/feature/parent/data/entities/category_entity.dart';

import '../../../../core/errors/faluire.dart';
import '../../../../core/services/api_service.dart';
import '../../../../core/services/end_points.dart';
import '../models/category_model.dart';
import 'category_repo.dart';

class CategoryRepoImpl implements CategoryRepo {
  final ApiService apiService;

  CategoryRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategories() async {
    try {
      final response = await apiService.get(
        endPoint: EndPoints.category,
      );

      log("📚 Categories Response: $response");

      if (response is Map<String, dynamic>) {
        final message = response['message'];
        final succeeded = response['succeeded'];
        final data = response['data'];

        if (succeeded == true && data != null) {
          final categories = (data as List)
              .map((e) => CategoryModel.fromJson(e))
              .toList();

          return right(categories);
        } else {
          return left(
            ServerFailure(
              errorMessage: message ?? "Failed to get categories",
            ),
          );
        }
      } else {
        return left(
          ServerFailure(
            errorMessage: "Unexpected response format",
          ),
        );
      }
    } on DioException catch (e) {
      log('❌ DioException (Categories): ${e.message}');
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      log('❌ Unexpected Error (Categories): $e');
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}