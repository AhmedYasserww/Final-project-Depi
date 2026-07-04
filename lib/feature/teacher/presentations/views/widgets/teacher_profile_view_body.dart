import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kids_education_learning/core/service_locator/service_locator.dart';
import 'package:kids_education_learning/core/utils/app_color.dart';
import 'package:kids_education_learning/core/utils/app_style.dart';
import 'package:kids_education_learning/core/widgets/custom_button.dart';
import 'package:kids_education_learning/core/widgets/profile_widgets/custom_stat_card.dart';
import 'package:kids_education_learning/core/widgets/profile_widgets/custom_session_card.dart';
import 'package:kids_education_learning/feature/parent_auth/presentation/manager/teacher_profile/teacher_profile_cubit.dart';
import 'package:kids_education_learning/feature/parent_auth/presentation/manager/teacher_profile/teacher_profile_state.dart';
import 'package:kids_education_learning/feature/parent_auth/presentation/views/widgets/create_course_bottom_sheet.dart';

class TeacherProfileViewBody extends StatefulWidget {
  const TeacherProfileViewBody({super.key});
  @override
  State<TeacherProfileViewBody> createState() => _TeacherProfileViewBodyState();
}

class _TeacherProfileViewBodyState extends State<TeacherProfileViewBody> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<TeacherProfileCubit>()..getTeacherProfile(),
      child: Scaffold(
        backgroundColor: AppColors.backGroundColor,
        body: SafeArea(
          child: BlocBuilder<TeacherProfileCubit, TeacherProfileState>(
            builder: (context, state) {
              if (state is TeacherProfileLoadingFetch ||
                  state is TeacherProfileInitial) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is TeacherProfileLoadFailure) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      state.errorMessage,
                      textAlign: TextAlign.center,
                      style: AppStyle.styleGreyRegular16,
                    ),
                  ),
                );
              }

              if (state is! TeacherProfileLoaded) {
                return const Center(child: CircularProgressIndicator());
              }

              final profile = state.profile;

              return SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Header
                    const Text(
                      'Profile',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        color: AppColors.blackColor,
                        fontFamily: 'Inter',
                      ),
                    ),
                    const SizedBox(height: 30),

                    /// Avatar
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        width: 100,
                        height: 100,
                        color: const Color(0xFFB0A8D9),
                        child: profile.profileImage.isNotEmpty
                            ? Image.network(
                          profile.profileImage,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => const Icon(
                            Icons.person,
                            size: 80,
                            color: Colors.white,
                          ),
                        )
                            : const Icon(
                          Icons.person,
                          size: 80,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),

                    /// Name
                    Text(
                      profile.fullName,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: AppColors.labelTextColor,
                        fontFamily: 'Inter',
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text('\$${profile.hourlyRate}/hr', style: AppStyle.styleBoldShop16),
                    const SizedBox(height: 20),

                    /// Stats
                    Row(
                      children: [
                        Expanded(
                          child: CustomStatCard(
                            value: profile.lessonsCompleted.toString(),
                            label: 'Lessons completed',
                            icon: Container(
                              padding: const EdgeInsets.all(2),
                              decoration: const BoxDecoration(
                                color: Color(0xFF4CAF50),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 16,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: CustomStatCard(
                            value: profile.scheduledLessons.toString(),
                            label: 'Scheduled lessons',
                            icon: const Icon(
                              Icons.calendar_today_outlined,
                              color: AppColors.darkBlueColor,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),

                    /// Bio
                    Text(
                      profile.bio.isNotEmpty ? profile.bio : 'No bio added yet.',
                      style: AppStyle.styleGreyRegular16,
                    ),
                    const SizedBox(height: 20),
                    const Divider(color: Color(0xFFE0E0E0), thickness: 1),
                    const SizedBox(height: 20),

                    /// Available Sessions
                    const Text(
                      'Available sessions',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: AppColors.labelTextColor,
                        fontFamily: 'Inter',
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'These are the session times your clients can book.',
                      style: AppStyle.styleGreyRegular16,
                    ),
                    const SizedBox(height: 16),

                    const Row(
                      children: [
                        Expanded(
                          child: CustomSessionCard(
                            duration: '30 minutes',
                            label: 'Lesson',
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: CustomSessionCard(
                            duration: '1 hour',
                            label: 'Lesson',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    CustomButton(
                      text: 'Add Course',
                      onTap: () async {
                        await showCreateCourseBottomSheet(context);
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}