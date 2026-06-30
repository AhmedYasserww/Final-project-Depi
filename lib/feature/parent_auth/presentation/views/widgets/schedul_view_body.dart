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

            /// TITLE
            const Flexible(
              child: Text(
                "Schedule",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppStyle.styleBold32,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              "Find a suitable teacher to schedule lesson for your child.",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppStyle.styleGreyRegular16,
            ),

            const SizedBox(height: 16),

            /// SEARCH
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 42,
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
                    width: 34,
                    height: 34,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            /// TEACHERS GRID
            Expanded(
              child: GridView.builder(
                itemCount: 2,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.72,
                ),
                itemBuilder: (context, index) {
                  final teachers = [
                    {
                      "name": "Sarah Eastwood",
                      "sessions": "43 sessions",
                      "reviews": "(19 reviews)",
                      "price": "\$80/hr",
                      "image": AppImages.imageWom
                    },
                    {
                      "name": "Noah Dawson",
                      "sessions": "58 sessions",
                      "reviews": "(32 reviews)",
                      "price": "\$80/hr",
                      "image": AppImages.imageMan
                    }
                  ];

                  final teacher = teachers[index];

                  return CustomTeacherCard(
                    name: teacher["name"]!,
                    sessions: teacher["sessions"]!,
                    reviews: teacher["reviews"]!,
                    price: teacher["price"]!,
                    flagIcon: AppImages.country,
                    image: teacher["image"]!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}