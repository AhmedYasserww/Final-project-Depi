import 'package:flutter/material.dart';

class DaySchedule {
  final String name;
  bool isEnabled;
  TimeOfDay startTime;
  TimeOfDay endTime;

  DaySchedule({
    required this.name,
    this.isEnabled = true,
    this.startTime = const TimeOfDay(hour: 9, minute: 0),
    this.endTime = const TimeOfDay(hour: 17, minute: 0),
  });
}