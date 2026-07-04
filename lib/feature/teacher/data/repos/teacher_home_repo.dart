import 'package:dartz/dartz.dart';
import 'package:kids_education_learning/core/errors/faluire.dart';
import 'package:kids_education_learning/feature/teacher/data/entites/teacher_overview_entity.dart';

abstract class TeacherHomeRepo {
  Future<Either<Failure, TeacherOverviewEntity>> getTeacherOverview();
}