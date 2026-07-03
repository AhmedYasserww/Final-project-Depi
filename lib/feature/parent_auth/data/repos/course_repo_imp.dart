import 'package:dio/dio.dart';
import 'package:kids_education_learning/core/services/end_points.dart';
import 'package:kids_education_learning/feature/parent_auth/data/entites/course_entity.dart';
import 'package:kids_education_learning/feature/parent_auth/data/repos/course_repo.dart';
import '../../../../core/services/api_service.dart';
import '../models/course_model.dart';

class CourseRepoImpl implements CourseRepo {
  final ApiService apiService;

  CourseRepoImpl({required this.apiService});

  @override
  Future<CourseEntity> addCourse({
    required String title,
    required String description,
    required int categoryId,
    required String videoPath,
    required String videoName,
  }) async {
    final formData = FormData.fromMap({
      'Title': title,
      'Description': description,
      'CategoryId': categoryId,
      'VideoFile': await MultipartFile.fromFile(videoPath, filename: videoName),
    });

    final response = await apiService.postMultipart(
      endPoint: EndPoints.addCourse,
      data: formData,
    );

    if (response is Map<String, dynamic> && response['succeeded'] == true) {
      return CourseModel.fromJson(response['data'] as Map<String, dynamic>);
    }

    final message = (response is Map<String, dynamic>)
        ? (response['message']?.toString() ??
              (response['errors'] is List &&
                      (response['errors'] as List).isNotEmpty
                  ? response['errors'][0].toString()
                  : 'Failed to add course'))
        : 'Failed to add course';

    throw Exception(message);
  }
}
