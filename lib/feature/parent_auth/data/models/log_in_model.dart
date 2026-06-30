// features/auth/data/models/login_model.dart
import '../entites/log_in_entity.dart';

class LoginModel extends LoginEntity {
  LoginModel({
    required super.id,
    required super.email,
    required super.phoneNumber,
    required super.role,
    required super.isEmailConfirmed,
    required super.accessToken,
    required super.refreshToken,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      id: json['id'] ?? '',
      email: json['email'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      role: json['role'] ?? '',
      isEmailConfirmed: json['isEmailConfirmed'] ?? false,
      accessToken: json['accessToken'] ?? '',
      refreshToken: json['refreshToken'] ?? '',
    );
  }
}