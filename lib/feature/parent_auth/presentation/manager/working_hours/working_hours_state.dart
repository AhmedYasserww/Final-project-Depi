import 'package:equatable/equatable.dart';
import 'package:kids_education_learning/feature/parent_auth/data/models/working_hours_model.dart';

abstract class WorkingHoursState extends Equatable {
  const WorkingHoursState();

  @override
  List<Object?> get props => [];
}

class WorkingHoursInitial extends WorkingHoursState {}

class WorkingHoursLoading extends WorkingHoursState {}

class WorkingHoursSuccess extends WorkingHoursState {
  final UpdateWorkingHoursResponseModel response;

  const WorkingHoursSuccess(this.response);

  @override
  List<Object?> get props => [response];
}

class WorkingHoursFailure extends WorkingHoursState {
  final String message;

  const WorkingHoursFailure(this.message);

  @override
  List<Object?> get props => [message];
}