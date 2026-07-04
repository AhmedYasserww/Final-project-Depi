
import 'package:dartz/dartz.dart';
import 'package:kids_education_learning/feature/auth/data/entities/log_in_entity.dart';
import 'package:kids_education_learning/feature/auth/presentaions/auth_parent/data/entities/parent_register_entity.dart';
import 'package:kids_education_learning/feature/teacher/data/entites/teacher_profile_entity.dart';
import '../../../../core/errors/faluire.dart';
import '../../presentaions/auth_teacher/presentations/manager/teacher_register_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, LoginEntity>> login({
    required String email,
    required String password,
  });

  Future<Either<Failure, TeacherRegisterEntity>> teacherRegister({
    required String email,
    required String password,
    required String fullName,
  });

  Future<Either<Failure, TeacherProfileEntity>> updateTeacherProfile({
    required String country,
    required double hourlyRate,
    required String bio,
    String? imagePath,
  });

  // ✅ جديد
  Future<Either<Failure, TeacherProfileEntity>> getTeacherProfile();

  Future<Either<Failure, ParentRegisterEntity>> parentRegister({
    required String email,
    required String password,
    required String fullName,
  });
}