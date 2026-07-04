import 'package:flutter/material.dart';
import 'package:kids_education_learning/core/utils/app_color.dart';
import 'package:kids_education_learning/core/utils/app_style.dart';

class CustomAvailabilityRow extends StatelessWidget {
  const CustomAvailabilityRow({
    super.key,
    required this.dayLabel,
    required this.isActive,
    this.timeRange,
  });

  final String dayLabel;
  final bool isActive;
  final String? timeRange;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: isActive ? Colors.white : const Color(0xFFF7F7F7),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isActive ? AppColors.cardBorderColor : const Color(0xFFEDEDED),
          width: 1.2,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isActive
                      ? const Color(0xFF4CAF50)
                      : const Color(0xFFBDBDBD),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                dayLabel,
                style: AppStyle.styleScheduleRegular16.copyWith(
                  fontWeight: FontWeight.w600,
                  color: isActive
                      ? AppColors.labelTextColor
                      : const Color(0xFFA0A0A0),
                ),
              ),
            ],
          ),
          Text(
            isActive ? (timeRange ?? '') : 'Not available',
            style: AppStyle.styleGreyRegular14.copyWith(
              color: isActive
                  ? AppColors.darkBlueColor
                  : const Color(0xFFA0A0A0),
              fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}