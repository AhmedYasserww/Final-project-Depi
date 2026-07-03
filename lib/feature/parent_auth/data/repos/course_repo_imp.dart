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

  @override
  Future<List<CourseEntity>> getTeacherLessons({
    required String teacherId,
  }) async {
    final response = await apiService.get(
      endPoint: '${EndPoints.lessonByTeacher}/$teacherId',
    );

    if (response is Map<String, dynamic> &&
        response['succeeded'] == true &&
        response['data'] is List) {
      return (response['data'] as List)
          .map((json) => CourseModel.fromJson(json as Map<String, dynamic>))
          .toList();
    }

    final message = (response is Map<String, dynamic>)
        ? (response['message']?.toString() ?? 'Failed to load lessons')
        : 'Failed to load lessons';

    throw Exception(message);
  }

  @override
Future<String> reserveLesson({required String lessonId}) async {
  final response = await apiService.post(
    endPoint: '${EndPoints.reserveLesson}/$lessonId',
    data: const {},
  );

  if (response is Map<String, dynamic> && response['succeeded'] == true) {
    return response['data']?.toString() ?? 'Lesson reserved successfully';
  }

  final message = (response is Map<String, dynamic>)
      ? (response['message']?.toString() ??
          (response['errors'] is List && (response['errors'] as List).isNotEmpty
              ? response['errors'][0].toString()
              : 'Failed to reserve lesson'))
      : 'Failed to reserve lesson';

  throw Exception(message);
}
}
