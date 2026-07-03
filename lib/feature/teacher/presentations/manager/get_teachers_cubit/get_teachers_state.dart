import '../../../../parent_auth/data/entites/teacher_entity.dart';

abstract class GetTeachersState {}

class GetTeachersInitial extends GetTeachersState {}

class GetTeachersLoading extends GetTeachersState {}

class GetTeachersSuccess extends GetTeachersState {
  GetTeachersSuccess(this.teachers);
  final List<TeacherEntity> teachers;
}

class GetTeachersFailure extends GetTeachersState {
  GetTeachersFailure(this.errorMessage);
  final String errorMessage;
}