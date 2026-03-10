import 'package:flutter/material.dart';
import 'package:kids_education_learning/core/utils/app_color.dart';
import 'package:kids_education_learning/core/utils/app_dimensions.dart';
import 'package:kids_education_learning/core/utils/app_style.dart';

class CustomeLessonsCard extends StatefulWidget {
  const CustomeLessonsCard({
    super.key,
    required this.childName,
    required this.state,
    required this.instructorName,
    required this.date,
    required this.duration,
    required this.category,
  });
  final String childName;
  final String state;
  final String instructorName;
  final String date;
  final String duration;
  final String category;
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
                          child: Image.asset(
                            "assets/icons/start_lesson_icon.jpg",
                            fit: BoxFit.contain,
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
              SizedBox(height: 2),
              Text(
                "${widget.date} • ${widget.duration} • Category: Mixed",
                style: AppStyle.styleGreyRegular14,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
