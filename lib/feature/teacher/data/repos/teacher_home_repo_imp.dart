import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:kids_education_learning/core/errors/faluire.dart';
import 'package:kids_education_learning/feature/teacher/data/entites/teacher_overview_entity.dart';
import '../../../../core/services/api_service.dart';
import '../models/teacher_overview_model.dart';
import 'teacher_home_repo.dart';

class TeacherHomeRepoImpl implements TeacherHomeRepo {
  final ApiService apiService;

  TeacherHomeRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, TeacherOverviewEntity>> getTeacherOverview() async {
    try {
      final response = await apiService.get(endPoint: 'Overview/teacher');
      final model = TeacherOverviewModel.fromJson(response);
      return Right(model);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}