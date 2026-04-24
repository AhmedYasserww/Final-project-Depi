import 'package:flutter/material.dart';
import 'package:kids_education_learning/core/utils/app_color.dart';

class CustomActivityButton extends StatefulWidget {
  const CustomActivityButton({
    super.key,
    required this.leading,
    this.raduis,
    this.bottomPadding,
    this.rightPadding,
    this.leftPadding,
    this.topPadding,
  });

  final String leading;
  final double ?raduis;
  final double ?bottomPadding;
  final double ?rightPadding;
  final double ?leftPadding;
  final double ?topPadding;
  @override
  State<CustomActivityButton> createState() => _CustomActivityButtonState();
}

class _CustomActivityButtonState extends State<CustomActivityButton> {
  bool ispressed = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: widget.leftPadding ?? 16.0, right: widget.rightPadding ?? 16, bottom: widget.bottomPadding ?? 16, top: widget.topPadding ?? 0),
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
            borderRadius:BorderRadius.circular(widget.raduis?? 100),
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
                child: Transform.scale(
                  scale: 1,
                  child: Checkbox(
                    value: ispressed,
                    onChanged: (value) {
                      setState(() {
                        ispressed = value ?? false;
                      });
                    },
                    activeColor: AppColors.secondryTextColor,
                    checkColor: Colors.white,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    side: BorderSide(
                      color: ispressed
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