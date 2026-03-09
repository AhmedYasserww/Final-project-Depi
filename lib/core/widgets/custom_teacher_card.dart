import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kids_education_learning/core/utils/app_color.dart';
import 'package:kids_education_learning/core/utils/app_style.dart';

class CustomTeacherCard extends StatelessWidget {
  const CustomTeacherCard({
    super.key,
    required this.name,
    required this.sessions,
    required this.reviews,
    required this.price,
    required this.flagIcon,
    required this.image,
  });

  final String name;
  final String sessions;
  final String reviews;
  final String price;
  final String flagIcon;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderColor),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 24,
                backgroundColor: Colors.grey.shade200,
                backgroundImage: AssetImage(image),
              ),
              const Spacer(),
              Image.asset(flagIcon, width: 125),
            ],
          ),

          const SizedBox(height: 8),

          Text(name, style: AppStyle.styleBold16),
          const SizedBox(height: 5),
          Text(sessions, style: AppStyle.styleRegular14),
          Text(reviews, style: AppStyle.styleGreyRegular14),
          const SizedBox(height: 4),
          Text(price, style: AppStyle.styleBold14),
          const SizedBox(height: 8),

          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                "View Profile",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: AppColors.darkBlueColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}