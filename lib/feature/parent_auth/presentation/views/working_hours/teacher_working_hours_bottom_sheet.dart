import 'package:flutter/material.dart';
import 'package:kids_education_learning/core/utils/app_style.dart';
import 'package:kids_education_learning/feature/parent_auth/presentation/views/working_hours/models/day_schedule.dart';
import 'package:kids_education_learning/feature/parent_auth/presentation/views/working_hours/widgets/custom_time_picker_sheet.dart';
import 'package:kids_education_learning/feature/parent_auth/presentation/views/working_hours/widgets/day_row.dart';
import 'package:kids_education_learning/feature/parent_auth/presentation/views/working_hours/widgets/working_hours_success_dialog.dart';

class TeacherWorkingHoursBottomSheet extends StatefulWidget {
  const TeacherWorkingHoursBottomSheet({super.key});

  @override
  State<TeacherWorkingHoursBottomSheet> createState() =>
      _TeacherWorkingHoursBottomSheetState();
}

class _TeacherWorkingHoursBottomSheetState
    extends State<TeacherWorkingHoursBottomSheet> {
  final List<DaySchedule> _days = [
    DaySchedule(
      name: 'Mondays',
      startTime: const TimeOfDay(hour: 8, minute: 0),
    ),
    DaySchedule(name: 'Tuesdays'),
    DaySchedule(name: 'Wednesdays'),
    DaySchedule(name: 'Thursdays'),
    DaySchedule(name: 'Fridays'),
    DaySchedule(name: 'Saturdays'),
    DaySchedule(name: 'Sundays'),
  ];

  String _formatTime(TimeOfDay t) {
    final hour = t.hourOfPeriod == 0 ? 12 : t.hourOfPeriod;
    final minute = t.minute.toString().padLeft(2, '0');
    final period = t.period == DayPeriod.am ? 'am' : 'pm';
    return '$hour:$minute$period';
  }

  Future<void> _pickTime(int index) async {
    final day = _days[index];

    final result = await showModalBottomSheet<Map<String, TimeOfDay>>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) =>
          CustomTimePickerSheet(startTime: day.startTime, endTime: day.endTime),
    );

    if (result == null) return;
    setState(() {
      day.startTime = result['start']!;
      day.endTime = result['end']!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFf2f2f2),
        borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10),
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(2)),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                      color: Color(0xFF007AFF),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const Text(
                  'Working hours',
                  style: AppStyle.styleScheduleMedium17,
                ),
                TextButton(
                  onPressed: () async {
                    // Show success dialog
                    await showDialog(
                      context: context,
                      barrierDismissible: true,
                      barrierColor: Colors.black.withOpacity(0.3),
                      builder: (_) => const WorkingHoursSuccessDialog(),
                    );

                    // Close the bottom sheet and return data after dialog is dismissed
                    if (context.mounted) {
                      Navigator.pop(context, _days);
                    }
                  },
                  child: const Text(
                    'Save',
                    style: TextStyle(
                      color: Color(0xFF007AFF),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 28),
            child: Text(
              'Set weekly hours that you are\navailable for a scheduled lesson',
              textAlign: TextAlign.center,
              style: AppStyle.styleGreyScheduleRegular14,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _days.length,
                separatorBuilder: (_, __) =>
                    const Padding(padding: EdgeInsets.only(bottom: 16)),
                itemBuilder: (_, i) => DayRow(
                  day: _days[i],
                  onToggle: (val) => setState(() => _days[i].isEnabled = val),
                  onTimeTap: () => _pickTime(i),
                  formatTime: _formatTime,
                ),
              ),
            ),
          ),
          const SizedBox(height: 63),
        ],
      ),
    );
  }
}
