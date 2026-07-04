import 'package:flutter/material.dart';
import 'package:kids_education_learning/core/utils/app_color.dart';

class CustomActivityButton extends StatelessWidget {
  const CustomActivityButton({
    super.key,
    required this.leading,
    required this.isSelected,
    required this.onTap,
    this.raduis,
    this.bottomPadding,
    this.rightPadding,
    this.leftPadding,
    this.topPadding,
  });

  final String leading;
  final bool isSelected;
  final VoidCallback onTap;
  final double? raduis;
  final double? bottomPadding;
  final double? rightPadding;
  final double? leftPadding;
  final double? topPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: leftPadding ?? 16.0,
        right: rightPadding ?? 16,
        bottom: bottomPadding ?? 16,
        top: topPadding ?? 0,
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(raduis ?? 100),
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
                        color: AppColors.secondryTextColor)
                    : TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryTextColor),
              ),
              SizedBox(
                height: 22,
                width: 22,
                child: Transform.scale(
                  scale: 1,
                  child: Checkbox(
                    value: isSelected,
                    onChanged: (_) => onTap(),
                    activeColor: AppColors.secondryTextColor,
                    checkColor: Colors.white,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    side: BorderSide(
                      color: isSelected
                          ? AppColors.secondryTextColor
                          : Color(0xFFDFDFDF),
                      width: 2,
                    ),
                    shape: const CircleBorder(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}