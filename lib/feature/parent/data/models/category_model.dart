import 'package:kids_education_learning/feature/parent/data/entities/category_entity.dart';

class CategoryModel extends CategoryEntity{
  CategoryModel({
    required super.id,
    required super.categoryName,
    required super.categoryImageUrl,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] ?? 0,
      categoryName: json['categoryName'] ?? '',
      categoryImageUrl: json['categoryImageUrl'] ?? '',
    );
  }
}