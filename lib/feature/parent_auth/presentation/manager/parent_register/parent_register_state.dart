// feature/parent_auth/presentation/manager/parent_register/parent_register_state.dart

import 'package:kids_education_learning/feature/parent_auth/data/entites/parent_register_entity.dart';

abstract class ParentRegisterState {}

class ParentRegisterInitial extends ParentRegisterState {}

class ParentRegisterLoading extends ParentRegisterState {}

class ParentRegisterSuccess extends ParentRegisterState {
  final ParentRegisterEntity entity;
  ParentRegisterSuccess(this.entity);
}

class ParentRegisterFailure extends ParentRegisterState {
  final String errorMessage;
  ParentRegisterFailure(this.errorMessage);
}