import 'package:flutter/material.dart';
import 'package:kids_education_learning/core/utils/app_color.dart';
import 'package:kids_education_learning/core/utils/app_style.dart';
import 'package:kids_education_learning/feature/parent_auth/presentation/views/working_hours/models/day_schedule.dart';

class DayRow extends StatelessWidget {
  final DaySchedule day;
  final ValueChanged<bool> onToggle;
  final VoidCallback onTimeTap;
  final String Function(TimeOfDay) formatTime;

  const DayRow({
    super.key,
    required this.day,
    required this.onToggle,
    required this.onTimeTap,
    required this.formatTime,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Row(
        children: [
          SizedBox(
            width: 51,
            height: 31,
            child: Switch(
              value: day.isEnabled,
              onChanged: onToggle,
              activeColor: Colors.white,
              activeTrackColor: AppColors.darkBlueColor,
              inactiveThumbColor: Colors.white,
              inactiveTrackColor: const Color(0xFFebebeb),
              thumbIcon: MaterialStateProperty.all(
                const Icon(Icons.circle, color: Colors.white, size: 27),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(day.name, style: AppStyle.styleDaysNameRegular14),
          ),
          GestureDetector(
            onTap: day.isEnabled ? onTimeTap : null,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: day.isEnabled
                      ? Colors.grey.shade300
                      : Colors.grey.shade200,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: day.isEnabled
                  ? Text(
                      '${formatTime(day.startTime)} - ${formatTime(day.endTime)}',
                      style: const TextStyle(fontSize: 14),
                    )
                  : const Text(
                      'Unavailable',
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}