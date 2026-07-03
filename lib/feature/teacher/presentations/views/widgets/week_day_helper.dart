class WeekDayHelper {
  /// Order Monday → Sunday
  static const List<String> orderedDays = [
    'monday',
    'tuesday',
    'wendsday', // API typo — kept as-is to match backend key
    'thursday',
    'friday',
    'saturday',
    'sunday',
  ];

  static String displayName(String rawDay) {
    switch (rawDay.toLowerCase()) {
      case 'monday':
        return 'Monday';
      case 'tuesday':
        return 'Tuesday';
      case 'wendsday':
        return 'Wednesday';
      case 'thursday':
        return 'Thursday';
      case 'friday':
        return 'Friday';
      case 'saturday':
        return 'Saturday';
      case 'sunday':
        return 'Sunday';
      default:
        return rawDay;
    }
  }

  static String formatTimeRange(String start, String end) {
    return '${_formatTime(start)} - ${_formatTime(end)}';
  }

  static String _formatTime(String time) {
    // "09:00:00" -> "9:00 AM"
    final parts = time.split(':');
    if (parts.length < 2) return time;

    int hour = int.tryParse(parts[0]) ?? 0;
    final minute = parts[1];
    final period = hour >= 12 ? 'PM' : 'AM';
    hour = hour % 12;
    if (hour == 0) hour = 12;

    return '$hour:$minute $period';
  }
}