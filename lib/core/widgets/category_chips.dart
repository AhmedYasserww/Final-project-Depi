import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kids_education_learning/core/service_locator/service_locator.dart';
import 'package:kids_education_learning/feature/parent_auth/presentation/manager/category_cubit/category_cubit.dart';

import '../../../../../../core/utils/app_color.dart';
// NOTE: verify state/entity field names (id, name) against your real
// CategoryCubit — this is written against the most likely shape.

class CategoryChips extends StatelessWidget {
  final int? selectedCategoryId;
  final ValueChanged<int> onSelected;

  const CategoryChips({
    super.key,
    required this.selectedCategoryId,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<CategoryCubit>()..getCategories(),
      child: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          if (state is CategoryLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is CategoryFailure) {
            return Text(state.errorMessage, style: const TextStyle(color: Colors.red));
          }
          if (state is CategorySuccess) {
            return Wrap(
              spacing: 10,
              runSpacing: 10,
              children: state.categories.map((category) {
                final bool selected = category.id == selectedCategoryId;
                return ChoiceChip(
                  label: Text(category.categoryName),
                  selected: selected,
                  onSelected: (_) => onSelected(category.id),
                  selectedColor: AppColors.primaryColor,
                  backgroundColor: const Color(0xFFF3F3F7),
                  labelStyle: TextStyle(
                    color: selected ? Colors.white : AppColors.blackColor,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Inter',
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(
                      color: selected ? AppColors.primaryColor : const Color(0xFFE0E0E0),
                    ),
                  ),
                  showCheckmark: false,
                );
              }).toList(),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}