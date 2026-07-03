import 'package:flutter/material.dart';
import 'package:kids_education_learning/core/utils/app_color.dart';
import 'custom_calender.dart';

class SelectDateSheet extends StatefulWidget {
  const SelectDateSheet({
    super.key,
    required this.lessonDuration,
    required this.onDateConfirmed,
  });

  final String lessonDuration;
  final ValueChanged<DateTime> onDateConfirmed;

  @override
  State<SelectDateSheet> createState() => _SelectDateSheetState();
}

class _SelectDateSheetState extends State<SelectDateSheet> {
  DateTime? _selectedDate;

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

          /// Header: title centered, Close on the right
          SizedBox(
            height: 24,
            child: Stack(
              alignment: Alignment.center,
              children: [
                const Text(
                  'Select date',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                    color: AppColors.labelTextColor,
                    fontFamily: 'Inter',
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Text(
                      'Close',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryColor,
                        fontFamily: 'Inter',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          Text(
            'In your local timezone (${DateTime.now().timeZoneName})',
            style: TextStyle(fontSize: 13, color: Colors.grey.shade600, fontFamily: 'Inter'),
          ),
          const SizedBox(height: 4),
          RichText(
            text: TextSpan(
              style: const TextStyle(fontSize: 13, fontFamily: 'Inter', color: AppColors.labelTextColor),
              children: [
                const TextSpan(text: 'Lesson duration: '),
                TextSpan(text: widget.lessonDuration, style: const TextStyle(fontWeight: FontWeight.w700)),
              ],
            ),
          ),
          const SizedBox(height: 16),

          CustomCalendar(
            onDateSelected: (date) => setState(() => _selectedDate = date),
          ),
          const SizedBox(height: 20),

          SizedBox(
            width: double.infinity,
            height: 52,
            child: ElevatedButton(
              onPressed: _selectedDate == null
                  ? null
                  : () {
                Navigator.pop(context);
                widget.onDateConfirmed(_selectedDate!);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                disabledBackgroundColor: AppColors.primaryColor.withOpacity(0.4),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
              ),
              child: const Text(
                'continue',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white, fontFamily: 'Inter'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}