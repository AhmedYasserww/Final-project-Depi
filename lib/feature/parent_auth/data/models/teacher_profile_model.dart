// feature/parent_auth/data/models/teacher_profile_model.dart

import '../entites/teacher_profile_entity.dart';

class TeacherProfileModel extends TeacherProfileEntity {
  TeacherProfileModel({
    required super.id,
    required super.email,
    required super.fullName,
    required super.registrationPhase,
    required super.profileImage,
    required super.bio,
    required super.country,
    required super.hourlyRate,
  });

  factory TeacherProfileModel.fromJson(Map<String, dynamic> json) {
    return TeacherProfileModel(
      id:                json['id']                ?? '',
      email:             json['email']             ?? '',
      fullName:          json['fullName']           ?? '',
      registrationPhase: json['registrationPhase'] ?? 0,
      profileImage:      json['profileImage']       ?? '',
      bio:               json['bio']               ?? '',
      country:           json['country']            ?? '',
      hourlyRate:        (json['hourlyRate'] as num?)?.toDouble() ?? 0.0,
    );
  }
}