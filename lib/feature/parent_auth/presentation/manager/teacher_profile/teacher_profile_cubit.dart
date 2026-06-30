// feature/parent_auth/presentation/cubits/teacher_profile/teacher_profile_cubit.dart

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../data/repos/auth_repo.dart';
import 'teacher_profile_state.dart';

class TeacherProfileCubit extends Cubit<TeacherProfileState> {
  final AuthRepo authRepo;
  TeacherProfileCubit({required this.authRepo}) : super(TeacherProfileInitial());

  String? pickedImagePath;

  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage() async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );
    if (image != null) {
      pickedImagePath = image.path;
      emit(TeacherProfileImagePicked(image.path));
    }
  }

  Future<void> updateProfile({
    required String country,
    required String hourlyRate,
    required String bio,
  }) async {
    // Basic validation
    if (country.isEmpty) {
      emit(TeacherProfileFailure("Please select a country"));
      return;
    }
    if (hourlyRate.isEmpty) {
      emit(TeacherProfileFailure("Please enter your hourly rate"));
      return;
    }
    final rate = double.tryParse(hourlyRate);
    if (rate == null) {
      emit(TeacherProfileFailure("Please enter a valid hourly rate"));
      return;
    }
    if (bio.isEmpty) {
      emit(TeacherProfileFailure("Please enter your bio"));
      return;
    }

    emit(TeacherProfileLoading());

    final result = await authRepo.updateTeacherProfile(
      country:    country,
      hourlyRate: rate,
      bio:        bio,
      imagePath:  pickedImagePath,
    );

    result.fold(
      (failure) => emit(TeacherProfileFailure(failure.errorMessage)),
      (profile) => emit(TeacherProfileSuccess(profile)),
    );
  }
}