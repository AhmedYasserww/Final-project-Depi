

import 'package:kids_education_learning/feature/teacher/data/repos/teacher_repo.dart';

import '../../../../core/services/api_service.dart';
import '../../../../core/services/end_points.dart';
import '../entites/teacher_entity.dart';
import '../models/teacher_model.dart';

class TeacherRepoImpl implements TeacherRepo {
  TeacherRepoImpl({required this.apiService});

  final ApiService apiService;

  @override
  Future<List<TeacherEntity>> getTeachers() async {
    final response = await apiService.get(endPoint: EndPoints.teachers);

    if (response is Map<String, dynamic> && response['succeeded'] == true) {
      final List<dynamic> data = response['data'] ?? [];
      return data
          .map((e) => TeacherModel.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    throw Exception(
      response is Map<String, dynamic>
          ? (response['message'] ?? 'Failed to get teachers')
          : 'Failed to get teachers',
    );
  }

  @override
  Future<TeacherEntity> getTeacherProfile({required String id}) async {
    final response = await apiService.get(
      endPoint: '${EndPoints.teacherProfileById}/$id',
    );

    if (response is Map<String, dynamic> && response['succeeded'] == true) {
      return TeacherModel.fromJson(response['data'] as Map<String, dynamic>);
    }

    throw Exception(
      response is Map<String, dynamic>
          ? (response['message'] ?? 'Failed to get teacher profile')
          : 'Failed to get teacher profile',
    );
  }
}