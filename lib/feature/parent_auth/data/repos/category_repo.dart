import 'package:dartz/dartz.dart';
import 'package:kids_education_learning/core/errors/faluire.dart';
import 'package:kids_education_learning/feature/parent_auth/data/entites/category_entity.dart';



abstract class CategoryRepo {
  Future<Either<Failure, List<CategoryEntity>>> getCategories();
}