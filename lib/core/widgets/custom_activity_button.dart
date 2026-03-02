import 'package:flutter/material.dart';
import 'package:kids_education_learning/core/utils/app_color.dart';

class CustomActivityButton extends StatefulWidget {
  const CustomActivityButton({
    super.key,
    required this.leading,
  });

  final String leading;

  @override
  State<CustomActivityButton> createState() => _CustomActivityButtonState();
}

class _CustomActivityButtonState extends State<CustomActivityButton> {
  bool ispressed = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16, bottom: 16),
      child: GestureDetector(
        onTap: () {
          setState(() {
            ispressed = !ispressed; 
          });
        },
        child: Container(
          width: double.infinity,
          height: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: ispressed
                ? Border.all(color: Color(0xFFB4BBFF), width: 1)
                : Border.all(color: Color(0xFFDFDFDF), width: 2),
            color: ispressed
                ? AppColors.selectedTextfieldColor
                : AppColors.backGroundColor,
          ),
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.leading,
                style: ispressed
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
                child: Checkbox(       
                  value: ispressed,
                  onChanged: (value) {
                    setState(() {
                      ispressed = value ?? false;
                    });
                  },
                  activeColor: AppColors.secondryTextColor,
                  checkColor: Colors.white,
                  side: BorderSide(
                    color: ispressed
                        ? AppColors.secondryTextColor
                        : Color(0xFFDFDFDF),
                    width: 2,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
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