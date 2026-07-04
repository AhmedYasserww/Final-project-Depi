class TeacherRegisterEntity {
  final String id;
  final String email;
  final int registrationPhase;
  final String role;
  final String fullName;
  final String bio;
  final String country;
  final double hourlyRate;
  final String accessToken;
  final String refreshToken;

  TeacherRegisterEntity({
    required this.id,
    required this.email,
    required this.registrationPhase,
    required this.role,
    required this.fullName,
    required this.bio,
    required this.country,
    required this.hourlyRate,
    required this.accessToken,
    required this.refreshToken,
  });
}