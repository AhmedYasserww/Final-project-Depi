import '../../../parent_auth/data/entites/teacher_entity.dart';

abstract class TeacherRepo {
  Future<List<TeacherEntity>> getTeachers();

  Future<TeacherEntity> getTeacherProfile({required String id});
}