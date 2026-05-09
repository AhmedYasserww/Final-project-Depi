// feature/parent_auth/presentation/cubits/teacher_profile/teacher_profile_state.dart

import '../../../data/entites/teacher_profile_entity.dart';

abstract class TeacherProfileState {}

class TeacherProfileInitial extends TeacherProfileState {}

class TeacherProfileLoading extends TeacherProfileState {}

class TeacherProfileSuccess extends TeacherProfileState {
  final TeacherProfileEntity profile;
  TeacherProfileSuccess(this.profile);
}

class TeacherProfileFailure extends TeacherProfileState {
  final String errorMessage;
  TeacherProfileFailure(this.errorMessage);
}

// Separate state just for image picking (so UI doesn't reset on image change)
class TeacherProfileImagePicked extends TeacherProfileState {
  final String imagePath;
  TeacherProfileImagePicked(this.imagePath);
}