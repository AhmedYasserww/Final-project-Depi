// features/auth/data/entities/login_entity.dart
class LoginEntity {
  final String id;
  final String email;
  final String phoneNumber;
  final String role;
  final bool isEmailConfirmed;
  final String accessToken;
  final String refreshToken;

  LoginEntity({
    required this.id,
    required this.email,
    required this.phoneNumber,
    required this.role,
    required this.isEmailConfirmed,
    required this.accessToken,
    required this.refreshToken,
  });
}