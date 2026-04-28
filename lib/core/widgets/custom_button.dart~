import 'package:flutter/material.dart';

import '../utils/app_color.dart';
import '../utils/app_dimensions.dart';
import '../utils/app_style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.textStyle,
    required this.onTap,
    this.buttonColor,
    this.height,
    this.textButtonColor,
    this.border,
    this.radius,
    this.widget,
  });

  final String text;
  final TextStyle? textStyle;
  final void Function() onTap;
  final Color? buttonColor;
  final Color? textButtonColor;
  final double? height;
  final BoxBorder? border;
  final double? radius;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: height ?? 48,
        decoration: BoxDecoration(
          border: border,
          borderRadius: BorderRadius.circular(
            radius ?? AppDimensions.buttonRadius2,
          ),
          color: buttonColor ?? AppColors.buttonColor,
        ),
        child: Center(
          child: Row(
            spacing: 12,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (widget != null) widget!,
              Text(
                text,
                style: (textStyle ?? AppStyle.styleWhiteRegular16).copyWith(

                //color: textButtonColor ?? Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
