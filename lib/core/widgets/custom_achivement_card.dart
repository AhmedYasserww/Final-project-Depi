import 'package:flutter/material.dart';
import 'package:kids_education_learning/core/utils/app_images.dart';
import 'package:kids_education_learning/core/utils/app_style.dart';

class CustomAchievementCard extends StatelessWidget {
  final int current;
  final int total;
  final VoidCallback onTap;

  const CustomAchievementCard({
    super.key,
    required this.current,
    required this.total,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: double.infinity,
        height: 64,
        padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 24),
        decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: const Color(0xFFDFDFDF),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Image.asset(
              "assets/images/vector.png",
              width: 24,
              height: 24,
              fit: BoxFit.contain,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                "Achievements ($current / $total)",
                style:  AppStyle.achievementsStyle,
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Color(0xFF707070),
              size: 24,
            ),
          ],
        ),
      ),
    );
  }
}