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
    this.isLoading = false,
    this.width
  });

  final String text;
  final TextStyle? textStyle;
  final VoidCallback? onTap;
  final Color? buttonColor;
  final Color? textButtonColor;
  final double? height;
  final BoxBorder? border;
  final double? radius;
  final Widget? widget;
  final double? width;

  /// New
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isLoading ? null : onTap,
      child: Container(
        width: width ?? double.infinity,
        height: height ?? 48,
        decoration: BoxDecoration(
          border: border,
          borderRadius: BorderRadius.circular(
            radius ?? AppDimensions.buttonRadius2,
          ),
          color: buttonColor ?? AppColors.buttonColor,
        ),
        child: Center(
          child: isLoading
              ? const SizedBox(
                  width: 22,
                  height: 22,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.5,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (widget != null) ...[
                      widget!,
                      const SizedBox(width: 12),
                    ],
                    Text(
                      text,
                      style: (textStyle ?? AppStyle.styleWhiteRegular16)
                          .copyWith(
                        color: textButtonColor ?? Colors.white,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}