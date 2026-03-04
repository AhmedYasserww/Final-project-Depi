import 'package:flutter/material.dart';
import 'package:kids_education_learning/core/utils/app_color.dart';
import 'package:kids_education_learning/core/utils/app_dimensions.dart';
import 'package:kids_education_learning/core/widgets/custom_button.dart';
import 'package:kids_education_learning/core/widgets/custom_label_text.dart';
import 'package:kids_education_learning/core/widgets/custom_subtitle_text_in_screen.dart';
import 'package:kids_education_learning/core/widgets/custom_text_field.dart';
import 'package:kids_education_learning/core/widgets/custom_title_text_in_screen.dart';

class AddChildNameViewBody extends StatelessWidget {
  const AddChildNameViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: AppColors.backGroundColor,
      body: Padding(
        padding: const EdgeInsets.only(
          left: AppDimensions.homeScreenPadding,
          right: AppDimensions.homeScreenPadding,
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTitleText(text: 'Add children'),
              CustomSubtitleText(
                text: 'You can only add 1 child on a free plan.',
                fontSize: 14,
              ),
              SizedBox(height: 24),
              LabelText(label: 'Child’s Name'),
              SizedBox(height: 8),
              SizedBox(
                height: 48,
                child: CustomTextField(
                  hintText: 'Jacob',
                  hintColor: Color(0xFF000846),
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: CustomButton(
                  text: 'Continue',
                  onTap: () {},
                  buttonColor: AppColors.buttonColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
