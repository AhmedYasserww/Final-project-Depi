// feature/parent_auth/presentation/cubits/teacher_profile/teacher_profile_state.dart

import '../../../../../../teacher/data/entites/teacher_profile_entity.dart';

abstract class TeacherProfileState {}

class TeacherProfileInitial extends TeacherProfileState {}

// ── Update flow ──
class TeacherProfileLoading extends TeacherProfileState {}

class TeacherProfileSuccess extends TeacherProfileState {
  final TeacherProfileEntity profile;
  TeacherProfileSuccess(this.profile);
}

class TeacherProfileFailure extends TeacherProfileState {
  final String errorMessage;
  TeacherProfileFailure(this.errorMessage);
}

class TeacherProfileImagePicked extends TeacherProfileState {
  final String imagePath;
  TeacherProfileImagePicked(this.imagePath);
}

// ── Get/Load flow ──
class TeacherProfileLoadingFetch extends TeacherProfileState {}

class TeacherProfileLoaded extends TeacherProfileState {
  final TeacherProfileEntity profile;
  TeacherProfileLoaded(this.profile);
}

class TeacherProfileLoadFailure extends TeacherProfileState {
  final String errorMessage;
  TeacherProfileLoadFailure(this.errorMessage);
}