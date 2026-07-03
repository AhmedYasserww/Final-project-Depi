import 'package:flutter/material.dart';
import 'package:kids_education_learning/core/utils/app_color.dart';

class CustomTabButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const CustomTabButton({super.key, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.activeStateColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.primaryColor, width: 1.2),
        ),
        child: Row(
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
