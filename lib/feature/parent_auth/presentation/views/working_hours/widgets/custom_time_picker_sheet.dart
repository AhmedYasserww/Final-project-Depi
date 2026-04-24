import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kids_education_learning/core/utils/app_style.dart';
import 'package:kids_education_learning/core/widgets/custom_button.dart';
import 'package:kids_education_learning/feature/parent_auth/presentation/views/working_hours/widgets/time_tab.dart';
import 'package:kids_education_learning/core/utils/app_color.dart';

class CustomTimePickerSheet extends StatefulWidget {
  final TimeOfDay startTime;
  final TimeOfDay endTime;

  const CustomTimePickerSheet({
    super.key,
    required this.startTime,
    required this.endTime,
  });

  @override
  State<CustomTimePickerSheet> createState() => _CustomTimePickerSheetState();
}

class _CustomTimePickerSheetState extends State<CustomTimePickerSheet> {
  bool _isStart = true;

  late DateTime _startDateTime;
  late DateTime _endDateTime;

  @override
  void initState() {
    super.initState();
    _startDateTime = _toDateTime(widget.startTime);
    _endDateTime = _toDateTime(widget.endTime);
  }

  DateTime _toDateTime(TimeOfDay t) {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day, t.hour, t.minute);
  }

  TimeOfDay _toTimeOfDay(DateTime dt) =>
      TimeOfDay(hour: dt.hour, minute: dt.minute);

  String _formatTime(TimeOfDay t) {
    final hour = t.hourOfPeriod == 0 ? 12 : t.hourOfPeriod;
    final minute = t.minute.toString().padLeft(2, '0');
    final period = t.period == DayPeriod.am ? 'AM' : 'PM';
    return '$hour:$minute $period';
  }

  @override
  Widget build(BuildContext context) {
    final currentDateTime = _isStart ? _startDateTime : _endDateTime;

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                TimeTab(
                  label: 'Start time',
                  time: _formatTime(_toTimeOfDay(_startDateTime)),
                  isSelected: _isStart,
                  onTap: () => setState(() => _isStart = true),
                ),
                const SizedBox(width: 12),
                TimeTab(
                  label: 'End time',
                  time: _formatTime(_toTimeOfDay(_endDateTime)),
                  isSelected: !_isStart,
                  onTap: () => setState(() => _isStart = false),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 180,
            child: CupertinoDatePicker(
              key: ValueKey(_isStart),
              mode: CupertinoDatePickerMode.time,
              initialDateTime: currentDateTime,
              use24hFormat: false,
              onDateTimeChanged: (dt) {
                setState(() {
                  if (_isStart) {
                    _startDateTime = dt;
                  } else {
                    _endDateTime = dt;
                  }
                });
              },
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              width: double.infinity,
              child: CustomButton(
                text: "Use these times",
                textStyle: AppStyle.styleSemiBoldWhite16,
                onTap: () => Navigator.pop(context, {
                  'start': _toTimeOfDay(_startDateTime),
                  'end': _toTimeOfDay(_endDateTime),
                }),
              ),
            ),
          ),
          const SizedBox(height: 27),
          CustomButton(
            text: "Cancel",
            onTap: () => Navigator.pop(context),
            buttonColor: AppColors.backGroundColor,
            textStyle: AppStyle.styleSemiBoldGrey16,
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}