import 'package:flutter/material.dart';
import 'package:kids_education_learning/core/utils/app_color.dart';
import 'package:kids_education_learning/core/utils/app_dimensions.dart';
import 'package:kids_education_learning/core/utils/app_style.dart';
import 'package:kids_education_learning/core/widgets/custom_activity_button.dart';
import 'package:kids_education_learning/core/widgets/custom_button.dart';
import 'package:kids_education_learning/core/widgets/custom_slider_thump_shape.dart';
import 'package:kids_education_learning/feature/parent_auth/presentation/views/working_hours/teacher_working_hours_bottom_sheet.dart';

class TeacherScheduleViewBody extends StatefulWidget {
  const TeacherScheduleViewBody({super.key});
  @override
  State<TeacherScheduleViewBody> createState() =>
      _TeacherScheduleViewBodyState();
}

class _TeacherScheduleViewBodyState extends State<TeacherScheduleViewBody> {
  double value = 30;
  String formatDuration(double minutes) {
    int m = minutes.round();

    if (m < 60) {
      return "${m}m";
    } else {
      int hours = m ~/ 60;
      int remainingMinutes = m % 60;

      if (remainingMinutes == 0) {
        return "${hours}h";
      }

      return "${hours}h ${remainingMinutes}m";
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(
          right: AppDimensions.homeScreenPadding,
          left: AppDimensions.homeScreenPadding,
          top: AppDimensions.teacherScheduleScreenTopPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Schedule", style: AppStyle.styleSemiBold24),
            SizedBox(height: 8),
            Text(
              "This information will be visible to all users.",
              style: AppStyle.styleGreyRegularShop14,
            ),
            SizedBox(height: 24),
            Text("Availability", style: AppStyle.styleSemiBold14),
            SizedBox(height: 4),
            GestureDetector(
              onTap: () => showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (_) => SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: const TeacherWorkingHoursBottomSheet(),
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.cardBorderColor),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Working hours",
                        style: AppStyle.styleScheduleRegular16,
                      ),
                      Icon(Icons.arrow_forward_ios_rounded, size: 16),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 24),
            Text("Lesson duration", style: AppStyle.styleSemiBold14),
            SizedBox(height: 4),

            LayoutBuilder(
              builder: (context, constraints) {
                final trackWidth = constraints.maxWidth;
                final thumbFraction = (value - 30) / (240 - 30);

                // Account for thumb radius so label doesn't go off-screen
                const thumbRadius = 14.0;
                final usableWidth = trackWidth - (thumbRadius * 2);
                final thumbX = thumbRadius + (thumbFraction * usableWidth);

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape: const CustomThumbShape(radius: 14),
                        trackHeight: 4,
                        overlayShape: const RoundSliderOverlayShape(
                          overlayRadius: 20,
                        ),
                      ),
                      child: Slider(
                        min: 30,
                        max: 240,
                        divisions: 7,
                        value: value,
                        activeColor: AppColors.darkBlueColor,
                        inactiveColor: Colors.grey.shade300,
                        onChanged: (v) {
                          setState(() {
                            value = v;
                          });
                        },
                      ),
                    ),

                    // Positioned label row
                    SizedBox(
                      width: trackWidth,
                      height: 20,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          // Static min label on the far left
                          Positioned(
                            left: 0,
                            child: Text(
                              "30m",
                              style: AppStyle.styleScheduleMedium14,
                            ),
                          ),
                          // Moving label that follows the thumb
                          Positioned(
                            left: (thumbX - 15).clamp(0, trackWidth - 40),
                            child: Text(
                              formatDuration(value),
                              style: AppStyle.styleScheduleMedium14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8), // spacing after label
                  ],
                );
              },
            ),
            SizedBox(height: 24),
            Text("Location", style: AppStyle.styleSemiBold14),
            SizedBox(height: 4),
            CustomActivityButton(
              leading: "Virtual (Online)",
              raduis: 10,
              bottomPadding: 8,
              leftPadding: 0,
              rightPadding: 0,
            ),
            CustomActivityButton(
              leading: "In-Person",
              raduis: 10,
              leftPadding: 0,
              rightPadding: 0,
            ),

            Spacer(),
            CustomButton(text: "Continue", onTap: () {}),
            SizedBox(height: 16),
            CustomButton(
              text: "Skip for now",
              onTap: () {},
              buttonColor: AppColors.backGroundColor,
              textStyle: AppStyle.styleScheduleSemiBold16,
            ),
          ],
        ),
      ),
    );
  }
}
