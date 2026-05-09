// features/auth/data/repos/auth_repo.dart
import 'package:dartz/dartz.dart';
import 'package:kids_education_learning/feature/parent_auth/data/entites/log_in_entity.dart';
import 'package:kids_education_learning/feature/parent_auth/data/entites/teacher_profile_entity.dart';
import 'package:kids_education_learning/feature/parent_auth/data/entites/teacher_register_entity.dart';

import '../../../../core/errors/faluire.dart';

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
    String? imagePath, // local file path from image_picker
  });
}
