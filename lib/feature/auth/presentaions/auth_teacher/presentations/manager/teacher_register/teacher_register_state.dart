
import '../teacher_register_entity.dart';


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