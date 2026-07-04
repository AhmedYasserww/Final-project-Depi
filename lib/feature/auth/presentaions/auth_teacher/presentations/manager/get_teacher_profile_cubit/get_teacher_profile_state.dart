import '../../../../../../teacher/data/entites/teacher_entity.dart';

abstract class GetTeacherProfileState {}

class GetTeacherProfileInitial extends GetTeacherProfileState {}

class GetTeacherProfileLoading extends GetTeacherProfileState {}

class GetTeacherProfileSuccess extends GetTeacherProfileState {
  GetTeacherProfileSuccess(this.teacher);
  final TeacherEntity teacher;
}

class GetTeacherProfileFailure extends GetTeacherProfileState {
  GetTeacherProfileFailure(this.errorMessage);
  final String errorMessage;
}