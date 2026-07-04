import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kids_education_learning/core/utils/app_color.dart';
import 'package:kids_education_learning/core/utils/app_style.dart';
import 'package:kids_education_learning/feature/parent_auth/presentation/manager/teacher_profile/teacher_profile_cubit.dart';
import 'package:kids_education_learning/feature/parent_auth/presentation/manager/teacher_profile/teacher_profile_state.dart';

import '../../../../../core/utils/app_dimensions.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_country_text_field.dart';
import '../../../../../core/widgets/custom_label_text.dart';
import '../../../../../core/widgets/custom_subtitle_text_in_screen.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../../../core/widgets/custom_title_text_in_screen.dart';
import '../teacher_schedule_view.dart';

class TeacherDetailsViewBody extends StatefulWidget {
  const TeacherDetailsViewBody({super.key});

  @override
  State<TeacherDetailsViewBody> createState() => _TeacherDetailsViewBodyState();
}

class _TeacherDetailsViewBodyState extends State<TeacherDetailsViewBody> {
  final TextEditingController _hourlyRateController = TextEditingController();
  final TextEditingController _bioController        = TextEditingController();
  final TextEditingController _countryController    = TextEditingController();

  @override
  void dispose() {
    _hourlyRateController.dispose();
    _bioController.dispose();
    _countryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TeacherProfileCubit, TeacherProfileState>(
      // Only listen for success/failure to avoid rebuilding on image pick
      listenWhen: (_, current) =>
          current is TeacherProfileSuccess || current is TeacherProfileFailure,
      listener: (context, state) {
        if (state is TeacherProfileSuccess) {
          Navigator.of(context).pushNamed(TeacherScheduleView.routeName);
        } else if (state is TeacherProfileFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        final cubit           = context.read<TeacherProfileCubit>();
        final isLoading       = state is TeacherProfileLoading;
        final pickedImagePath = cubit.pickedImagePath;

        return Scaffold(
          backgroundColor: AppColors.backGroundColor,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimensions.authScreenPadding,
                vertical: 24,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 6),
                          CustomTitleText(text: 'Account details'),
                          const SizedBox(height: 8),
                          CustomSubtitleText(
                            text: 'This information will be visible to all users.',
                            fontSize: 14,
                          ),
                          const SizedBox(height: 24),

                          // ── Profile Image Row ──────────────────────────────
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () => cubit.pickImage(),
                                child: CircleAvatar(
                                  radius: 35,
                                  backgroundColor: Colors.grey.shade200,
                                  backgroundImage: pickedImagePath != null
                                      ? FileImage(File(pickedImagePath))
                                      : null,
                                  child: pickedImagePath == null
                                      ? Image.asset(
                                          AppImages.avatar,
                                          width: 70,
                                          height: 70,
                                        )
                                      : null,
                                ),
                              ),
                              const SizedBox(width: 16),
                              GestureDetector(
                                onTap: () => cubit.pickImage(),
                                child: Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: AppColors.backGroundColor,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: const Color(0xFFDFDFDF),
                                      width: 1,
                                    ),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(
                                        Icons.add,
                                        color: Color(0xFF343B6E),
                                        size: 25,
                                      ),
                                      Flexible(
                                        child: Text(
                                          pickedImagePath == null
                                              ? 'Upload photo'
                                              : 'Change photo',
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: AppStyle.styleUploadPhoto16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 16),
                          LabelText(label: 'Country'),
                          const SizedBox(height: 4),
                      
                          CustomCountryTextField(
                            controller: _countryController,
                          ),

                          const SizedBox(height: 16),
                          LabelText(label: 'Hourly rate'),
                          const SizedBox(height: 4),
                          CustomTextField(
                            controller: _hourlyRateController,
                            fillColor: AppColors.backGroundColor,
                            hintColor: AppColors.iconArrowDown,
                            hintText: '\$0',
                            keyboardType: TextInputType.number,
                            suffixIcon: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 14,
                              ),
                              child: Text(
                                'AUD',
                                style: AppStyle.styleGreyRegular16,
                              ),
                            ),
                          ),

                          const SizedBox(height: 16),
                          LabelText(label: 'Your Bio'),
                          const SizedBox(height: 4),
                          CustomTextField(
                            controller: _bioController,
                            maxlines: 3,
                            minlines: 3,
                            hintColor: AppColors.iconArrowDown,
                            hintText: 'Include your experience...',
                          ),
                        ],
                      ),
                    ),
                  ),

                  // ── Continue Button ────────────────────────────────────────
                  isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : CustomButton(
                          text: 'Continue',
                          onTap: () {
                            cubit.updateProfile(
                              country:    _countryController.text.trim(),
                              hourlyRate: _hourlyRateController.text.trim(),
                              bio:        _bioController.text.trim(),
                            );
                          },
                          buttonColor: AppColors.buttonColor,
                        ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}