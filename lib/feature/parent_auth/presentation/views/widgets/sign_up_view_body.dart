import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kids_education_learning/core/utils/app_color.dart';
import 'package:kids_education_learning/core/utils/app_dimensions.dart';
import 'package:kids_education_learning/core/utils/app_images.dart';
import 'package:kids_education_learning/core/widgets/custom_button.dart';
import 'package:kids_education_learning/core/widgets/custom_text_field.dart';
import 'package:kids_education_learning/core/widgets/custom_label_text.dart';

import '../create_account_view.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: AppDimensions.authScreenPadding),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppImages.logo,),
                  SizedBox(height: 48,),
              
                  Align(
                    alignment: Alignment.topLeft,
                      child: LabelText(label: 'Email',)),
                  SizedBox(height: 4,),
                  CustomTextField(
                    isFilled: false,
                      hintText: "youremail@gmail.com"),
                  SizedBox(height: 18),
                  CustomButton(
                    text: 'Continue',
                    onTap: () {
                      Navigator.of(context).pushNamed(CreateAccountView.routeName);
                    },
                    buttonColor: AppColors.buttonColor,
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Color(0xFFDFDFDF),
                        ),
                      ),
              
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          "or",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xff707070),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
              
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Color(0xFFDFDFDF),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  CustomButton(
                    text: 'Continue with Google',
                    onTap: () {},
                    widget: Image.asset(
                      AppImages.google,
                      height: 24,
                      width: 24,
                    ),
                    buttonColor: AppColors.backGroundColor,
                    textButtonColor: Color(0xff010521),
                    border: BoxBorder.all(
                      color: AppColors.borderColor,
                      width: 1,
                    ),
                  ),
                  SizedBox(height: 16),
                  CustomButton(
                    text: 'Continue with Apple',
                    onTap: () {},
                    widget: Image.asset(
                      AppImages.apple,
                      height: 24,
                      width: 24,
                    ),
                    buttonColor: AppColors.backGroundColor,
                    textButtonColor: Colors.black,
                    border: BoxBorder.all(
                      color: AppColors.borderColor,
                      width: 1,
                    ),
                  ),
                  SizedBox(height: 16),
                  CustomButton(
                    text: 'Continue with Facebook',
                    onTap: () {},
                    widget: Image.asset(
                      AppImages.facebook,
                      height: 24,
                      width: 24,
                    ),
                    buttonColor: AppColors.backGroundColor,
                    textButtonColor: Colors.black,
                    border: BoxBorder.all(
                      color: AppColors.borderColor,
                      width: 1,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
