// features/auth/data/repos/auth_repo.dart
import 'package:dartz/dartz.dart';
import 'package:kids_education_learning/feature/parent_auth/data/entites/log_in_entity.dart';

import '../../../../core/errors/faluire.dart';


abstract class AuthRepo {
  Future<Either<Failure, LoginEntity>> login({
    required String email,
    required String password,
  });

}