import 'package:flutter/material.dart';
import 'package:kids_education_learning/core/utils/app_color.dart';

class LabelText extends StatelessWidget {
  const LabelText({super.key, required this.label});
  final String? label;
  @override
  Widget build(BuildContext context) {
    return Text(
      label!,
      style: TextStyle(color: AppColors.labelTextColor, fontSize: 14,fontWeight: FontWeight.w600),
    );
  }
}
