import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kids_education_learning/core/utils/app_dimensions.dart';
import 'package:kids_education_learning/core/utils/app_style.dart';
import 'package:kids_education_learning/core/widgets/custom_text_field.dart';
import 'package:kids_education_learning/core/widgets/custome_lessons_card.dart';

class LessonsViewBody extends StatefulWidget {
  const LessonsViewBody({super.key});

  @override
  State<LessonsViewBody> createState() => _LessonsViewBodyState();
}

class _LessonsViewBodyState extends State<LessonsViewBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: AppDimensions.lessonScreenPadding,
            top: AppDimensions.lessonScreenTopPadding,
            right: AppDimensions.lessonScreenPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Lessons", style: AppStyle.styleBold32),
              SizedBox(height: 8),
              Text(
                "Keep track of your current and completed lessons.",
                style: AppStyle.styleGreyRegular16,
              ),
              SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 36,
                      child: CustomTextField(
                        prefixIcon: Image.asset("assets/icons/search_icon.jpg"),
                        hintText: "Search",
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {},
                    child: SvgPicture.asset("assets/icons/filter_icon.svg"),
                  ),
                ],
              ),
              SizedBox(height: 24),
              CustomeLessonsCard(childName: "Jacob", state: "Active", instructorName:"Sarah Eastwood", date:"18/11/24",duration: "30 Minutes", category: "Mixed"),
              CustomeLessonsCard(childName: "Jacob", state: "Completed", instructorName:"Sarah Eastwood", date:"15/11/24",duration: "30 Minutes", category: "Mixed"),
              CustomeLessonsCard(childName: "Jacob", state: "Completed", instructorName:"Sarah Eastwood", date:"18/11/24",duration: "1hr", category: "Mixed"),
              CustomeLessonsCard(childName: "Jacob", state: "Completed", instructorName:"Sarah Eastwood", date:"18/11/24",duration: "30 Minutes", category: "Mixed"),
              CustomeLessonsCard(childName: "Jacob", state: "Completed", instructorName:"Sarah Eastwood", date:"18/11/24",duration: "30 Minutes", category: "Mixed"),
              CustomeLessonsCard(childName: "Jacob", state: "Completed", instructorName:"Sarah Eastwood", date:"18/11/24",duration: "30 Minutes", category: "Mixed"),


            ],
          ),
        ),
      ),
    );
  }}