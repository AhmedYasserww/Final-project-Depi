import 'package:flutter/material.dart';
import 'package:kids_education_learning/core/utils/app_color.dart';

class CustomDetailRow extends StatelessWidget {
  const CustomDetailRow({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    this.onTap,
  });

  final IconData icon;
  final String label;
  final String value;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.cardBorderColor, width: 1.2),
        ),
        child: Row(
          children: [
            Icon(icon, size: 20, color: AppColors.darkBlueColor),
            const SizedBox(width: 10),
            Text(
              label,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: AppColors.labelTextColor,
                fontFamily: 'Inter',
              ),
            ),
            const Spacer(),
            Text(
              value,
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
                fontFamily: 'Inter',
              ),
            ),
            if (onTap != null) ...[
              const SizedBox(width: 4),
              const Icon(Icons.chevron_right, size: 18, color: Colors.grey),
            ],
          ],
        ),
      ),
    );
  }
}