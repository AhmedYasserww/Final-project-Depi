// features/auth/presentation/cubits/teacher_register_state.dart

import 'package:kids_education_learning/feature/parent_auth/data/entites/teacher_register_entity.dart';


abstract class TeacherRegisterState {}

class TeacherRegisterInitial extends TeacherRegisterState {}

class TeacherRegisterLoading extends TeacherRegisterState {}

class TeacherRegisterSuccess extends TeacherRegisterState {
  final TeacherRegisterEntity entity;
  TeacherRegisterSuccess(this.entity);
}

class TeacherRegisterFailure extends TeacherRegisterState {
  final String errorMessage;
  TeacherRegisterFailure(this.errorMessage);
}