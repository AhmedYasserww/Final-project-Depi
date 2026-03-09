import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kids_education_learning/core/utils/app_images.dart';

class CustomCategoryCard extends StatelessWidget {
  const CustomCategoryCard({
    super.key,
    required this.title,
    required this.icon,
  });

  final String title;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _box(borderWidth: 4),
      child: Stack(
        children: [
          Positioned(
            right: -5,
            bottom: -5,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset(AppImages.cloud, width: 80),
                SvgPicture.asset(icon, width: 35),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 14, top: 18),
            child: SizedBox(
              width: 110,
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                  color: Color(0xFF343B6E),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  BoxDecoration _box({double borderWidth = 1.2}) {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: const Color(0xFFD9D9D9), width: borderWidth),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.12),
          blurRadius: 12,
          offset: const Offset(0, 6),
        ),
      ],
    );
  }
}