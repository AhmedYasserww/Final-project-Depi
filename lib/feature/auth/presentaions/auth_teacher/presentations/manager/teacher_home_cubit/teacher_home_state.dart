part of 'teacher_home_cubit.dart';

sealed class TeacherHomeState {}

final class TeacherHomeInitial extends TeacherHomeState {}

final class TeacherHomeLoading extends TeacherHomeState {}

final class TeacherHomeSuccess extends TeacherHomeState {
  final TeacherOverviewEntity overview;
  TeacherHomeSuccess({required this.overview});
}

final class TeacherHomeFailure extends TeacherHomeState {
  final String errMessage;
  TeacherHomeFailure({required this.errMessage});
}