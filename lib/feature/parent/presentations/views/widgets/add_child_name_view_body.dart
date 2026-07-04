import 'package:flutter/material.dart';
import 'package:kids_education_learning/core/helper_functions/validators.dart';
import 'package:kids_education_learning/core/utils/app_color.dart';
import 'package:kids_education_learning/core/utils/app_dimensions.dart';
import 'package:kids_education_learning/core/widgets/custom_button.dart';
import 'package:kids_education_learning/core/widgets/custom_label_text.dart';
import 'package:kids_education_learning/core/widgets/custom_subtitle_text_in_screen.dart';
import 'package:kids_education_learning/core/widgets/custom_text_field.dart';
import 'package:kids_education_learning/core/widgets/custom_title_text_in_screen.dart';

import '../../../../auth/presentaions/auth_parent/views/choose_goal_view.dart';

class AddChildNameViewBody extends StatefulWidget {
  const AddChildNameViewBody({super.key});

  @override
  State<AddChildNameViewBody> createState() => _AddChildNameViewBodyState();
}

class _AddChildNameViewBodyState extends State<AddChildNameViewBody> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController childNameController = TextEditingController();

  @override
  void dispose() {
    childNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.authScreenPadding,
          ),
          child: Form(
            key: _formKey,
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
                  controller: childNameController,
                  validator: Validators.validateName,
                ),
                Spacer(),
                CustomButton(
                  text: 'Continue',
                  onTap: () {
                    if (!_formKey.currentState!.validate()) return;
                    Navigator.of(context).pushNamed(ChooseGoalView.routeName);
                  },
                  buttonColor: AppColors.buttonColor,
                ),
                SizedBox(height: 12),
              ],
            ),
          ),
        ),
      ),
    );
  }
}