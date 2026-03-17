import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kids_education_learning/core/utils/app_color.dart';
import 'package:kids_education_learning/core/utils/app_style.dart';

import '../../../../../core/utils/app_dimensions.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_country_text_field.dart';
import '../../../../../core/widgets/custom_label_text.dart';
import '../../../../../core/widgets/custom_subtitle_text_in_screen.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../../../core/widgets/custom_title_text_in_screen.dart';

class TeacherDetailsViewBody extends StatelessWidget {
  const TeacherDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
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
                      SizedBox(height: 6),
                      CustomTitleText(text: 'Account details'),
                      SizedBox(height: 8),
                      CustomSubtitleText(
                        text: 'This information will be visible to all users.',
                        fontSize: 14,
                      ),
                      SizedBox(height: 24),
                      Row(
                        children: [
                          Image.asset(AppImages.avatar, width: 70, height: 70),
                          SizedBox(width: 16),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                color: AppColors.backGroundColor,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Color(0xFFDFDFDF),
                                  width: 1,
                                ),
                              ),

                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(
                                    Icons.add,
                                    color: Color(0xFF343B6E),
                                    size: 25,
                                  ),
                                  Flexible(
                                    child: Text(
                                      overflow: TextOverflow
                                          .ellipsis, // لو الخط ضخم جداً يحط نقط
                                      maxLines: 1,
                                      'Upload photo',
                                      style: AppStyle.styleUploadPhoto16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      LabelText(label: 'Country'),
                      SizedBox(height: 4),
                      CustomCountryTextField(),
                      SizedBox(height: 16),
                      LabelText(label: 'Hourly rate'),
                      SizedBox(height: 4),
                      CustomTextField(
                        fillColor: AppColors.backGroundColor,
                        hintColor: AppColors.iconArrowDown,
                        hintText: '\$0',
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
                      SizedBox(height: 16),
                      LabelText(label: 'Your Bio'),
                      SizedBox(height: 4),
                      CustomTextField(
                        maxlines: 3,
                        minlines: 3,
                        hintColor: AppColors.iconArrowDown,
                        hintText: 'Include your experience...',
                      ),
                    ],
                  ),
                ),
              ),
              CustomButton(
                text: 'Continue',
                onTap: () {},
                buttonColor: AppColors.buttonColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
