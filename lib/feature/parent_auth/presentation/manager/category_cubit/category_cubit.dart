import 'package:bloc/bloc.dart';
import 'package:kids_education_learning/feature/parent_auth/data/entites/category_entity.dart';
import 'package:meta/meta.dart';

import '../../../data/repos/category_repo.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final CategoryRepo categoryRepo;

  CategoryCubit(this.categoryRepo) : super(CategoryInitial());

  Future<void> getCategories() async {
    emit(CategoryLoading());

    final result = await categoryRepo.getCategories();

    if (result.isLeft()) {
      final failure = result.fold((f) => f, (_) => null)!;

      emit(
        CategoryFailure(
          errorMessage: failure.errorMessage,
        ),
      );
    } else {
      final categories = result.fold((_) => null, (r) => r)!;

      emit(
        CategorySuccess(
          categories: categories,
        ),
      );
    }
  }
}