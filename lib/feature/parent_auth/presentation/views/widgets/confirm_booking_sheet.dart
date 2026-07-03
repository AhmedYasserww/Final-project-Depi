import 'package:flutter/material.dart';
import 'package:kids_education_learning/core/utils/app_color.dart';

import 'custom_details_row.dart';

class ConfirmBookingSheet extends StatelessWidget {
  const ConfirmBookingSheet({
    super.key,
    required this.lessonDuration,
    required this.date,
    required this.childName,
    required this.category,
    required this.paymentMethod,
    required this.onConfirm,
  });

  final String lessonDuration;
  final DateTime date;
  final String childName;
  final String category;
  final String paymentMethod;
  final VoidCallback onConfirm;

  String get _formattedDate =>
      '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year.toString().substring(2)}';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
      decoration: const BoxDecoration(
        color: AppColors.backGroundColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          /// Header: Back left, title centered, Close right
          SizedBox(
            height: 24,
            child: Stack(
              alignment: Alignment.center,
              children: [
                const Text(
                  'Confirm booking',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                    color: AppColors.labelTextColor,
                    fontFamily: 'Inter',
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Text(
                      'Back',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: AppColors.primaryColor, fontFamily: 'Inter'),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () => Navigator.popUntil(context, (r) => r.isFirst),
                    child: const Text(
                      'Close',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: AppColors.primaryColor, fontFamily: 'Inter'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          CustomDetailRow(icon: Icons.access_time, label: 'Lesson duration', value: lessonDuration),
          const SizedBox(height: 12),
          CustomDetailRow(icon: Icons.calendar_today_outlined, label: 'Date', value: _formattedDate),
          const SizedBox(height: 12),
          CustomDetailRow(icon: Icons.face_outlined, label: 'Child', value: childName, onTap: () {}),
          const SizedBox(height: 12),
          CustomDetailRow(icon: Icons.apps_rounded, label: 'Category', value: category, onTap: () {}),
          const SizedBox(height: 12),
          CustomDetailRow(icon: Icons.credit_card_outlined, label: 'Payment method', value: paymentMethod, onTap: () {}),
          const SizedBox(height: 24),

          SizedBox(
            width: double.infinity,
            height: 52,
            child: ElevatedButton(
              onPressed: onConfirm,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
              ),
              child: const Text(
                'Confirm Booking',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white, fontFamily: 'Inter'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}