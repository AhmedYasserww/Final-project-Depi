import 'package:flutter/material.dart';
import 'package:kids_education_learning/core/utils/app_color.dart';
import 'package:kids_education_learning/core/utils/app_style.dart';

class CustomLessonCardParent extends StatelessWidget {
  final String name;
  final String? mode;
  final String? date;
  final String? duration;
  final String? category;

  const CustomLessonCardParent({
    super.key,
    required this.name,
    this.mode,
    this.date,
    this.duration,
    this.category,
  });

  @override
  Widget build(BuildContext context) {
    final metaItems = <String>[
      if (date != null && date!.isNotEmpty) date!,
      if (duration != null && duration!.isNotEmpty) duration!,
      if (category != null && category!.isNotEmpty) 'Category: $category',
    ];

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

          if (mode != null && mode!.isNotEmpty) ...[
            const SizedBox(height: 4),
            Text(
              mode!,
              style: AppStyle.styleGreyMedium13.copyWith(
                color: AppColors.darkBlueColor,
                fontSize: 15,
              ),
            ),
          ],

          if (metaItems.isNotEmpty) ...[
            const SizedBox(height: 6),
            Wrap(
              spacing: 6,
              runSpacing: 4,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                for (int i = 0; i < metaItems.length; i++) ...[
                  if (i != 0)
                    const Text(
                      '•',
                      style: TextStyle(
                        color: Color(0xFF666666),
                        fontSize: 15,
                      ),
                    ),
                  Text(
                    metaItems[i],
                    style: AppStyle.styleGreyRegular12.copyWith(fontSize: 15),
                  ),
                ],
              ],
            ),
          ],
        ],
      ),
    );
  }
}