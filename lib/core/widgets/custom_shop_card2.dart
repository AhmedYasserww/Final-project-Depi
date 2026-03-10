
import 'package:flutter/material.dart';
import 'package:kids_education_learning/core/utils/app_color.dart';
import 'package:kids_education_learning/core/utils/app_style.dart';
import 'package:kids_education_learning/core/widgets/custom_button.dart';

class ShopCard extends StatelessWidget {
  final Widget icon;
  final String title;
  final String subtitle;
  final String buttonText;

  const ShopCard({super.key, 
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        //color: Color(0xFFDFDFDF),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.cardBorderColor),
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              icon,
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: AppStyle.styleBoldShop16),
                    const SizedBox(height: 8),
                    Text(subtitle, style: AppStyle.styleGreyRegularShop14),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          CustomButton(text: "Buy for \$14.99",textStyle: AppStyle.styleBoldShopButton16, onTap: () {}),
        ],
      ),
    );
  }
}
