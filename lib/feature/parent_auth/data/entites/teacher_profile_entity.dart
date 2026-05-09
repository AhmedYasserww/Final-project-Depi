// feature/parent_auth/data/entites/teacher_profile_entity.dart

class TeacherProfileEntity {
  final String id;
  final String email;
  final String fullName;
  final int registrationPhase;
  final String profileImage;
  final String bio;
  final String country;
  final double hourlyRate;

  TeacherProfileEntity({
    required this.id,
    required this.email,
    required this.fullName,
    required this.registrationPhase,
    required this.profileImage,
    required this.bio,
    required this.country,
    required this.hourlyRate,
  });
}