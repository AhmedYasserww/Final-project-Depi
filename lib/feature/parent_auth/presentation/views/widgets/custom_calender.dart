import 'package:flutter/material.dart';
import 'package:kids_education_learning/core/utils/app_color.dart';

class CustomCalendar extends StatefulWidget {
  const CustomCalendar({
    super.key,
    required this.onDateSelected,
    this.initialSelectedDate,
  });

  final ValueChanged<DateTime> onDateSelected;
  final DateTime? initialSelectedDate;

  @override
  State<CustomCalendar> createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  late DateTime _displayedMonth;
  DateTime? _selectedDate;
  final DateTime _today = DateTime.now();

  static const _weekDays = ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'];
  static const _monthNames = [
    'January', 'February', 'March', 'April', 'May', 'June',
    'July', 'August', 'September', 'October', 'November', 'December',
  ];

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialSelectedDate;
    final base = widget.initialSelectedDate ?? _today;
    _displayedMonth = DateTime(base.year, base.month);
  }

  bool _isSameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;

  bool _isPast(DateTime day) {
    final todayDate = DateTime(_today.year, _today.month, _today.day);
    return day.isBefore(todayDate);
  }

  void _changeMonth(int delta) {
    setState(() {
      _displayedMonth = DateTime(_displayedMonth.year, _displayedMonth.month + delta);
    });
  }

  @override
  Widget build(BuildContext context) {
    final firstDayOfMonth = DateTime(_displayedMonth.year, _displayedMonth.month, 1);
    final daysInMonth = DateTime(_displayedMonth.year, _displayedMonth.month + 1, 0).day;
    final leadingEmptyCells = firstDayOfMonth.weekday % 7; // Sunday = 0

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.cardBorderColor, width: 1.2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Month header
          Row(
            children: [
              Text(
                '${_monthNames[_displayedMonth.month - 1]} ${_displayedMonth.year}',
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w800,
                  color: AppColors.darkBlueColor,
                  fontFamily: 'Inter',
                ),
              ),
              const SizedBox(width: 2),
              const Icon(Icons.keyboard_arrow_right, size: 20, color: AppColors.darkBlueColor),
              const Spacer(),
              InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () => _changeMonth(-1),
                child: const Padding(
                  padding: EdgeInsets.all(6),
                  child: Icon(Icons.chevron_left, color: AppColors.primaryColor),
                ),
              ),
              InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () => _changeMonth(1),
                child: const Padding(
                  padding: EdgeInsets.all(6),
                  child: Icon(Icons.chevron_right, color: AppColors.primaryColor),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          /// Weekday labels
          Row(
            children: _weekDays
                .map((d) => Expanded(
              child: Center(
                child: Text(
                  d,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                    fontFamily: 'Inter',
                  ),
                ),
              ),
            ))
                .toList(),
          ),
          const SizedBox(height: 8),

          /// Day grid
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: leadingEmptyCells + daysInMonth,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              mainAxisSpacing: 8,
              crossAxisSpacing: 4,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, index) {
              if (index < leadingEmptyCells) return const SizedBox.shrink();

              final day = index - leadingEmptyCells + 1;
              final date = DateTime(_displayedMonth.year, _displayedMonth.month, day);
              final isPast = _isPast(date);
              final isToday = _isSameDay(date, _today);
              final isSelected = _selectedDate != null && _isSameDay(date, _selectedDate!);

              return GestureDetector(
                onTap: isPast
                    ? null
                    : () {
                  setState(() => _selectedDate = date);
                  widget.onDateSelected(date);
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isSelected ? AppColors.primaryColor.withOpacity(0.15) : null,
                  ),
                  child: Text(
                    '$day',
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Inter',
                      fontWeight: isSelected || isToday ? FontWeight.w800 : FontWeight.w500,
                      color: isPast
                          ? Colors.grey.shade400
                          : (isSelected || isToday)
                          ? AppColors.primaryColor
                          : AppColors.labelTextColor,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}