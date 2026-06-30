// features/auth/presentation/views/widgets/login_social_buttons.dart
import 'package:flutter/material.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/widgets/custom_button.dart';

class LoginSocialButtons extends StatelessWidget {
  const LoginSocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Expanded(child: Divider(thickness: 1, color: Color(0xFFDFDFDF))),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                "or",
                style: TextStyle(
                  fontSize: 14,
                  color: const Color(0xff707070),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const Expanded(child: Divider(thickness: 1, color: Color(0xFFDFDFDF))),
          ],
        ),
        const SizedBox(height: 16),
        CustomButton(
          text: 'Continue with Google',
          onTap: () {},
          widget: Image.asset(AppImages.google, height: 24, width: 24),
          buttonColor: AppColors.backGroundColor,
          textButtonColor: const Color(0xff010521),
          border: BoxBorder.all(color: AppColors.borderColor, width: 1),
        ),
        const SizedBox(height: 16),
        CustomButton(
          text: 'Continue with Apple',
          onTap: () {},
          widget: Image.asset(AppImages.apple, height: 24, width: 24),
          buttonColor: AppColors.backGroundColor,
          textButtonColor: Colors.black,
          border: BoxBorder.all(color: AppColors.borderColor, width: 1),
        ),
        const SizedBox(height: 16),
        CustomButton(
          text: 'Continue with Facebook',
          onTap: () {},
          widget: Image.asset(AppImages.facebook, height: 24, width: 24),
          buttonColor: AppColors.backGroundColor,
          textButtonColor: Colors.black,
          border: BoxBorder.all(color: AppColors.borderColor, width: 1),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}