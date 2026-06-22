import 'package:flutter/material.dart';

import '../utils/app_color.dart';

class CustomSwitchProfile extends StatelessWidget {
  final String title;
  final bool isActive;
  final VoidCallback onTap;

  const CustomSwitchProfile({
    super.key,
    required this.title,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 114,
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFFE9EBFF) : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isActive ? const Color(0xFFB4BBFF) : const Color(0xFFDFDFDF),
            width: 2,
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isActive ?  AppColors.secondryTextColor :  AppColors.iconArrowDown,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}