import 'package:flutter/material.dart';
import 'package:kids_education_learning/core/utils/app_color.dart';
import 'package:kids_education_learning/core/utils/app_dimensions.dart';
import 'package:kids_education_learning/core/widgets/custom_button.dart';
import 'package:kids_education_learning/core/widgets/custom_label_text.dart';
import 'package:kids_education_learning/core/widgets/custom_subtitle_text_in_screen.dart';
import 'package:kids_education_learning/core/widgets/custom_text_field.dart';
import 'package:kids_education_learning/core/widgets/custom_title_text_in_screen.dart';
import 'package:kids_education_learning/feature/parent_auth/presentation/views/choose_goal_view.dart';

import '../choose_activity_view.dart';

class AddChildNameViewBody extends StatelessWidget {
  const AddChildNameViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppDimensions.authScreenPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 32),
              CustomTitleText(text: 'Add children'),
              CustomSubtitleText(
                text: 'You can only add 1 child on a free plan.',
                fontSize: 14,
              ),
              SizedBox(height: 24),
              LabelText(label: 'Child’s Name'),
              SizedBox(height: 8),
              CustomTextField(
                hintText: 'Jacob',
                hintColor: Color(0xFF000846),
                isFilled: false,
              ),
              Spacer(),
              CustomButton(
                text: 'Continue',
                onTap: () {
                  Navigator.of(context).pushNamed(ChooseGoalView.routeName);
                },
                buttonColor: AppColors.buttonColor,
              ),
              SizedBox(height: 12,),
            ],
          ),
        ),
      ),
    );
  }
}