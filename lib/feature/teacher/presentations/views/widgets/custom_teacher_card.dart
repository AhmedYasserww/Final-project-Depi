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
    required this.onViewProfile,
  });

  final String name;
  final String sessions;
  final String reviews;
  final String price;
  final String flagIcon;
  final String image;
  final VoidCallback onViewProfile;

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
                backgroundImage: _resolveImage(image),
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
          Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppStyle.styleBold16,
          ),
          const SizedBox(height: 4),
          if (sessions.isNotEmpty)
            Text(
              sessions,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppStyle.styleRegular14,
            ),
          if (reviews.isNotEmpty)
            Text(
              reviews,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppStyle.styleGreyRegular14,
            ),
          const SizedBox(height: 4),
          Text(
            price,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppStyle.styleBold14,
          ),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: onViewProfile,
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

  ImageProvider _resolveImage(String path) {
    if (path.isEmpty) {
      return const AssetImage('assets/images/avatar.png'); // 👈 ظبط الـ default اللي عندك
    }
    if (path.startsWith('http')) {
      return NetworkImage(path);
    }
    return AssetImage(path);
  }
}