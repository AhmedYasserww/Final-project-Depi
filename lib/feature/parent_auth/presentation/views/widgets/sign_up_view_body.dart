import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kids_education_learning/core/utils/app_color.dart';
import 'package:kids_education_learning/core/utils/app_images.dart';
import 'package:kids_education_learning/core/widgets/custom_button.dart';
import 'package:kids_education_learning/core/widgets/custom_text_field.dart';
import 'package:kids_education_learning/core/widgets/custom_label_text.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 98),
              child: SvgPicture.asset(AppImages.logo, width: 236, height: 108),
            ),

            Center(
              child: SizedBox(
                width: 361,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LabelText(label: 'Email',),
                    SizedBox(height: 4,),
                    CustomTextField(hintText: "youremail@gmail.com"),
                    SizedBox(height: 16),
                    CustomButton(
                      text: 'Continue',
                      onTap: () {},
                      buttonColor: AppColors.buttonColor,
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 2,
                            color: Color(0xFFDFDFDF),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            "OR",
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),

                        Expanded(
                          child: Divider(
                            thickness: 2,
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
                      textButtonColor: Colors.black,
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
          ],
        ),
      ),
    );
  }
}
