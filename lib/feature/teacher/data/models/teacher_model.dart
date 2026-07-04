import '../entites/teacher_entity.dart';

class WeeklyAvailabilityModel extends WeeklyAvailabilityEntity {
  const WeeklyAvailabilityModel({
    required super.id,
    required super.startTime,
    required super.endTime,
    required super.day,
    required super.isActive,
  });

  factory WeeklyAvailabilityModel.fromJson(Map<String, dynamic> json) {
    return WeeklyAvailabilityModel(
      id: json['id'] ?? '',
      startTime: json['startTime'] ?? '',
      endTime: json['endTime'] ?? '',
      day: json['day'] ?? '',
      isActive: json['isActive'] ?? false,
    );
  }
}

class TeacherModel extends TeacherEntity {
  const TeacherModel({
    required super.id,
    required super.email,
    required super.fullName,
    required super.registrationPhase,
    required super.profileImage,
    required super.bio,
    required super.country,
    required super.scheduledLesson,
    required super.completedLesson,
    required super.hourlyRate,
    required super.lessonDuration,
    required super.location,
    required super.weeklyAvailability,
  });

  factory TeacherModel.fromJson(Map<String, dynamic> json) {
    return TeacherModel(
      id: json['id'] ?? '',
      email: json['email'] ?? '',
      fullName: json['fullName'] ?? '',
      registrationPhase: json['registrationPhase'] ?? 0,
      profileImage: json['profileImage'] ?? '',
      bio: json['bio'] ?? '',
      country: json['country'] ?? '',
      scheduledLesson: json['scheduledLesson'] ?? 0,
      completedLesson: json['completedLesson'] ?? 0,
      hourlyRate: (json['hourlyRate'] as num?)?.toDouble() ?? 0.0,
      lessonDuration: json['lessonDuration'] ?? 0,
      location: json['location'] ?? '',
      weeklyAvailability: (json['weeklyAvailability'] as List<dynamic>? ?? [])
          .map(
            (e) => WeeklyAvailabilityModel.fromJson(e as Map<String, dynamic>),
      )
          .toList(),
    );
  }
}