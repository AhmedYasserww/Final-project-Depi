import 'package:flutter/material.dart';

class WeeklyAvailabilityEntity {
  final String? id;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final String day; // e.g. "saturday"
  final bool isActive;

  const WeeklyAvailabilityEntity({
    this.id,
    required this.startTime,
    required this.endTime,
    required this.day,
    required this.isActive,
  });
}

class WorkingHoursEntity {
  final String id;
  final int lessonDuration;
  final String location;
  final List<WeeklyAvailabilityEntity> weeklyAvailability;

  const WorkingHoursEntity({
    required this.id,
    required this.lessonDuration,
    required this.location,
    required this.weeklyAvailability,
  });
}