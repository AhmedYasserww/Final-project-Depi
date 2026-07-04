class WeeklyAvailabilityEntity {
  const WeeklyAvailabilityEntity({
    required this.id,
    required this.startTime,
    required this.endTime,
    required this.day,
    required this.isActive,
  });

  final String id;
  final String startTime;
  final String endTime;
  final String day;
  final bool isActive;
}

class TeacherEntity {
  const TeacherEntity({
    required this.id,
    required this.email,
    required this.fullName,
    required this.registrationPhase,
    required this.profileImage,
    required this.bio,
    required this.country,
    required this.scheduledLesson,
    required this.completedLesson,
    required this.hourlyRate,
    required this.lessonDuration,
    required this.location,
    required this.weeklyAvailability,
  });

  final String id;
  final String email;
  final String fullName;
  final int registrationPhase;
  final String profileImage;
  final String bio;
  final String country;
  final int scheduledLesson;
  final int completedLesson;
  final double hourlyRate;
  final int lessonDuration;
  final String location;
  final List<WeeklyAvailabilityEntity> weeklyAvailability;
}