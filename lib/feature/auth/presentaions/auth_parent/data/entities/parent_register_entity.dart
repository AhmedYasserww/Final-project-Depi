// feature/parent_auth/data/entites/parent_register_entity.dart

class ParentRegisterEntity {
  final String id;
  final String email;
  final int registrationPhase;
  final String role;
  final String fullName;
  final String accessToken;
  final String refreshToken;

  ParentRegisterEntity({
    required this.id,
    required this.email,
    required this.registrationPhase,
    required this.role,
    required this.fullName,
    required this.accessToken,
    required this.refreshToken,
  });
}