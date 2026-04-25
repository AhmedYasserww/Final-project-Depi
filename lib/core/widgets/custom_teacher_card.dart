import 'package:flutter/material.dart';
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
            children: [
              CircleAvatar(
                radius: 24,
                backgroundColor: Colors.grey.shade200,
                backgroundImage: AssetImage(image),
              ),

              const Spacer(),

              Image.asset(
                flagIcon,
                width: 28,
                height: 20,
                fit: BoxFit.contain,
              ),
            ],
          ),

          const SizedBox(height: 8),

          /// NAME
          Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppStyle.styleBold16,
          ),

          const SizedBox(height: 4),

          /// SESSIONS
          Text(
            sessions,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppStyle.styleRegular14,
          ),

          /// REVIEWS
          Text(
            reviews,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppStyle.styleGreyRegular14,
          ),

          const SizedBox(height: 4),

          /// PRICE
          Text(
            price,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppStyle.styleBold14,
          ),

          const Spacer(),

          /// BUTTON
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 8),
                minimumSize: const Size.fromHeight(36),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const FittedBox(
                child: Text(
                  "View Profile",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: AppColors.darkBlueColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}