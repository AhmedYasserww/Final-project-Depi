// feature/parent_auth/data/models/parent_register_model.dart

import '../entites/parent_register_entity.dart';

class ParentRegisterModel extends ParentRegisterEntity {
  ParentRegisterModel({
    required super.id,
    required super.email,
    required super.registrationPhase,
    required super.role,
    required super.fullName,
    required super.accessToken,
    required super.refreshToken,
  });

  factory ParentRegisterModel.fromJson(Map<String, dynamic> json) {
    return ParentRegisterModel(
      id:                json['id']                ?? '',
      email:             json['email']             ?? '',
      registrationPhase: json['registrationPhase'] ?? 0,
      role:              json['role']              ?? '',
      fullName:          json['fullName']          ?? '',
      accessToken:       json['accessToken']       ?? '',
      refreshToken:      json['refreshToken']      ?? '',
    );
  }
}