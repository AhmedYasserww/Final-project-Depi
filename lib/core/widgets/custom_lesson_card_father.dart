import 'package:flutter/material.dart';
import 'package:kids_education_learning/core/utils/app_color.dart';
import 'package:kids_education_learning/core/utils/app_style.dart';

class CustomLessonCardFather extends StatelessWidget {
  final String name;
  final String mode;
  final String date;
  final String duration;
  final String category;

  const CustomLessonCardFather({
    super.key,
    required this.name,
    required this.mode,
    required this.date,
    required this.duration,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 19),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: AppColors.cardBorderColor,
          width: 1.2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppColors.darkBlueColor,
            ),
          ),

          const SizedBox(height: 4),
          Text(
            mode,
            style: AppStyle.styleGreyMedium13.copyWith(
              color: AppColors.darkBlueColor,
              fontSize: 15,
            ),
          ),

          const SizedBox(height: 6),
          Wrap(
            spacing: 6,
            runSpacing: 4,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text(
                date,
                style: AppStyle.styleGreyRegular12.copyWith(fontSize: 15),
              ),
              const Text(
                '•',
                style: TextStyle(
                  color: Color(0xFF666666),
                  fontSize: 15,
                ),
              ),
              Text(
                duration,
                style: AppStyle.styleGreyRegular12.copyWith(fontSize: 15),
              ),
              const Text(
                '•',
                style: TextStyle(
                  color: Color(0xFF666666),
                  fontSize: 15,
                ),
              ),
              Text(
                'Category: $category',
                style: AppStyle.styleGreyRegular12.copyWith(fontSize: 15),
              ),
            ],
          ),
        ],
      ),
    );
  }
}