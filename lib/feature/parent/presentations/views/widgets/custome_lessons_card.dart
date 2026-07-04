import 'package:flutter/material.dart';
import 'package:kids_education_learning/core/utils/app_color.dart';
import 'package:kids_education_learning/core/utils/app_dimensions.dart';
import 'package:kids_education_learning/core/utils/app_style.dart';
import 'package:kids_education_learning/feature/achievements/presentations/views/lesson_flow_view.dart';
import 'package:kids_education_learning/feature/teacher/presentations/views/widgets/lesson_video_played_view.dart';

class CustomeLessonsCard extends StatefulWidget {
  const CustomeLessonsCard({
    super.key,
    required this.childName,
    required this.state,
    required this.instructorName,
    required this.date,
    required this.category,
    required this.videoUrl,
  });
  final String childName;
  final String state;
  final String instructorName;
  final String date;
  final String category;
  final String videoUrl;
  @override
  State<CustomeLessonsCard> createState() => _CustomeLessonsCardState();
}

class _CustomeLessonsCardState extends State<CustomeLessonsCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.borderColor),
          borderRadius: BorderRadius.circular(AppDimensions.buttonRadius),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${widget.childName}'s Lesson 4",
                    style: AppStyle.styleBold20,
                  ),
                  Row(
                    spacing: 8,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: widget.state == "Active"
                              ? AppColors.activeStateColor
                              : AppColors.completeStateColor,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Text(
                          widget.state,
                          style: widget.state == "Active"
                              ? AppStyle.styleMediumActiveState14
                              : AppStyle.styleMediumCompletedState14,
                        ),
                      ),
                      if (widget.state == "Active")
                        SizedBox(
                          width: 48,
                          height: 48,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                LessonVideoPlayerView.routeName,
                                arguments: {
                                  'videoUrl': widget.videoUrl,
                                  'title': widget.childName,
                                },
                              );
                            },
                            child: Image.asset(
                              "assets/icons/start_lesson_icon.jpg",
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 4),
              Text(
                "Instructor: ${widget.instructorName}",
                style: AppStyle.styleRegular14,
              ),
              Text(
                "Category: ${widget.category}",
                style: AppStyle.styleRegular14,
              ),
              SizedBox(height: 2),
            ],
          ),
        ),
      ),
    );
  }
}
