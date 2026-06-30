import 'package:flutter/material.dart';
import 'package:kids_education_learning/core/utils/app_color.dart';

class CustomGoalButton extends StatelessWidget {
  const CustomGoalButton({
    super.key,
    required this.leading,
    required this.trailing,
    required this.isSelected,
    required this.onTap,
  });

  final String leading;
  final String trailing;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16, bottom: 16),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: isSelected
                ? Border.all(color: Color(0xFFB4BBFF), width: 1)
                : Border.all(color: Color(0xFFDFDFDF), width: 2),
            color: isSelected
                ? AppColors.selectedTextfieldColor
                : AppColors.backGroundColor,
          ),
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                leading,
                style: isSelected
                    ? TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.secondryTextColor,
                      )
                    : TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryTextColor,
                      ),
              ),
              Text(
                trailing,
                style: isSelected
                    ? TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.secondryTextColor,
                      )
                    : TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryTextColor,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}