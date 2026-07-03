import 'package:flutter/material.dart';
import 'package:kids_education_learning/feature/parent_auth/data/entites/working_hours_entity.dart';
import 'package:kids_education_learning/feature/parent_auth/presentation/views/working_hours/models/day_schedule.dart';

class WeeklyAvailabilityModel extends WeeklyAvailabilityEntity {
  const WeeklyAvailabilityModel({
    super.id,
    required super.startTime,
    required super.endTime,
    required super.day,
    required super.isActive,
  });

  factory WeeklyAvailabilityModel.fromJson(Map<String, dynamic> json) {
    return WeeklyAvailabilityModel(
      id: json['id'] as String?,
      startTime: _timeFromJson(json['startTime'] as Map<String, dynamic>?),
      endTime: _timeFromJson(json['endTime'] as Map<String, dynamic>?),
      day: json['day'] as String? ?? '',
      isActive: json['isActive'] as bool? ?? false,
    );
  }

  static TimeOfDay _timeFromJson(Map<String, dynamic>? json) {
    return TimeOfDay(
      hour: json?['hour'] as int? ?? 0,
      minute: json?['minute'] as int? ?? 0,
    );
  }

  /// Only sends what the PUT endpoint's request body expects
  /// (hour/minute, day, isActive) — the extra time fields in the
  /// response schema (second, ticks, etc.) are read-only server output.
  Map<String, dynamic> toJson() {
    return {
      'startTime': {'hour': startTime.hour, 'minute': startTime.minute},
      'endTime': {'hour': endTime.hour, 'minute': endTime.minute},
      'day': day,
      'isActive': isActive,
    };
  }

  /// Builds a request item directly from the UI's [DaySchedule] model.
  factory WeeklyAvailabilityModel.fromDaySchedule(DaySchedule day) {
    return WeeklyAvailabilityModel(
      startTime: day.startTime,
      endTime: day.endTime,
      day: _apiDayName(day.name),
      isActive: day.isEnabled,
    );
  }

  static String _apiDayName(String uiName) {
    const map = {
      'Mondays': 'monday',
      'Tuesdays': 'tuesday',
      'Wednesdays': 'wednesday',
      'Thursdays': 'thursday',
      'Fridays': 'friday',
      'Saturdays': 'saturday',
      'Sundays': 'sunday',
    };
    return map[uiName] ?? uiName.toLowerCase();
  }
}

class WorkingHoursModel extends WorkingHoursEntity {
  const WorkingHoursModel({
    required super.id,
    required super.lessonDuration,
    required super.location,
    required super.weeklyAvailability,
  });

  factory WorkingHoursModel.fromJson(Map<String, dynamic> json) {
    return WorkingHoursModel(
      id: json['id'] as String? ?? '',
      lessonDuration: json['lessonDuration'] as int? ?? 0,
      location: json['location'] as String? ?? '',
      weeklyAvailability: (json['weeklyAvailability'] as List<dynamic>? ?? [])
          .map((e) =>
              WeeklyAvailabilityModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// Wraps the full API envelope: statusCode / succeeded / message / errors / data
class UpdateWorkingHoursResponseModel {
  final String statusCode;
  final bool succeeded;
  final String? message;
  final List<String> errors;
  final WorkingHoursModel? data;

  const UpdateWorkingHoursResponseModel({
    required this.statusCode,
    required this.succeeded,
    this.message,
    required this.errors,
    this.data,
  });

  factory UpdateWorkingHoursResponseModel.fromJson(Map<String, dynamic> json) {
    return UpdateWorkingHoursResponseModel(
      statusCode: json['statusCode']?.toString() ?? '',
      succeeded: json['succeeded'] as bool? ?? false,
      message: json['message'] as String?,
      errors: (json['errors'] as List<dynamic>? ?? [])
          .map((e) => e.toString())
          .toList(),
      data: json['data'] != null
          ? WorkingHoursModel.fromJson(json['data'] as Map<String, dynamic>)
          : null,
    );
  }
}