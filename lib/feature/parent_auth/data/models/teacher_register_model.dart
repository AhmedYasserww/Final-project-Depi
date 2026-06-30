import 'package:kids_education_learning/feature/parent_auth/data/entites/teacher_register_entity.dart';


class TeacherRegisterModel extends TeacherRegisterEntity {
  TeacherRegisterModel({
    required super.id,
    required super.email,
    required super.registrationPhase,
    required super.role,
    required super.fullName,
    required super.bio,
    required super.country,
    required super.hourlyRate,
    required super.accessToken,
    required super.refreshToken,
  });

  factory TeacherRegisterModel.fromJson(Map<String, dynamic> json) {
    return TeacherRegisterModel(
      id:                json['id']                as String,
      email:             json['email']             as String,
      registrationPhase: json['registrationPhase'] as int,
      role:              json['role']              as String,
      fullName:          json['fullName']          as String,
      bio:               json['bio']               as String,
      country:           json['country']           as String,
      hourlyRate:        (json['hourlyRate'] as num).toDouble(),
      accessToken:       json['accessToken']       as String,
      refreshToken:      json['refreshToken']      as String,
    );
  }
}