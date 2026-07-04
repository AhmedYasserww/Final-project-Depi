import 'package:flutter/material.dart';
import 'package:kids_education_learning/core/utils/app_color.dart';
import 'package:kids_education_learning/core/utils/app_style.dart';
import 'package:kids_education_learning/core/widgets/custom_button.dart';

class CustomBookCard extends StatelessWidget {
  const CustomBookCard({super.key, required this.duration, required this.label, required this.onBook});
  final String duration;
  final String label;
  final VoidCallback onBook;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.cardBorderColor, width: 1.2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                duration,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: AppColors.darkBlueColor,
                ),
              ),
              const SizedBox(height: 2),
              Text(label, style: AppStyle.styleGreyMedium14),
            ],
          ),

          CustomButton(text: "Book",width: 87 ,onTap: onBook)
        ],
      ),
    );
  }
}