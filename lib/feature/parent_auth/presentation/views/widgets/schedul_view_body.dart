import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kids_education_learning/core/utils/app_dimensions.dart';
import 'package:kids_education_learning/core/utils/app_images.dart';
import 'package:kids_education_learning/core/utils/app_style.dart';
import 'package:kids_education_learning/core/widgets/custom_text_field.dart';
import 'package:kids_education_learning/core/widgets/custom_teacher_card.dart';

class ScheduleViewBody extends StatefulWidget {
  const ScheduleViewBody({super.key});

  @override
  State<ScheduleViewBody> createState() => _ScheduleViewBodyState();
}

class _ScheduleViewBodyState extends State<ScheduleViewBody> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          left: AppDimensions.lessonScreenPadding,
          top: AppDimensions.lessonScreenTopPadding,
          right: AppDimensions.lessonScreenPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Schedule", style: AppStyle.styleBold32),
            const SizedBox(height: 8),
            Text(
              "Find a suitable teacher to schedule lesson\nfor your child.",
              style: AppStyle.styleGreyRegular16,
            ),
            const SizedBox(height: 16),

            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 38,
                    child: CustomTextField(
                      prefixIcon: SizedBox(
                        width: 22,
                        height: 22,
                        child: SvgPicture.asset(
                          "assets/icons/search_icon.svg",
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      hintText: "Search",
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: () {},
                  child: SvgPicture.asset(
                    "assets/icons/filter_icon.svg",
                    width: 33,
                    height: 33,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 25),

            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.85,
                children: [
                  CustomTeacherCard(
                    name: "Sarah Eastwood",
                    sessions: "43 sessions",
                    reviews: "(19 reviews)",
                    price: "\$80/hr",
                    flagIcon: AppImages.country,
                    image: AppImages.imageWom,
                  ),
                  CustomTeacherCard(
                    name: "Noah Dawson",
                    sessions: "58 sessions",
                    reviews: "(32 reviews)",
                    price: "\$80/hr",
                    flagIcon: AppImages.country,
                    image: AppImages.imageMan,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}