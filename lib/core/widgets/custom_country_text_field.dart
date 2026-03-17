import 'package:flutter/material.dart';
import 'package:kids_education_learning/core/utils/app_color.dart';
import 'package:kids_education_learning/core/utils/app_images.dart';
import 'package:kids_education_learning/core/utils/app_style.dart';

class CustomCountryTextField extends StatelessWidget {
  const CustomCountryTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: AppColors.backGroundColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.cardBorderColor, width: 1),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16,),
      child: TextFormField(
        readOnly: true,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          // isDense: true,
          border: InputBorder.none,
          hintText: 'Australia',
          hintStyle: AppStyle.CountryStyleTextForm,
          // suffixIconConstraints: const BoxConstraints(
          //   minHeight: 24,
          //   minWidth: 24,
          // ),
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(AppImages.Au),
              const SizedBox(width: 24),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  size: 20,
                  Icons.keyboard_arrow_down_rounded,
                  color: AppColors.iconArrowDown,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
