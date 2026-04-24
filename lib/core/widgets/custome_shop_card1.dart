

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kids_education_learning/core/utils/app_style.dart';
import 'package:kids_education_learning/core/widgets/custom_button.dart';
import 'package:kids_education_learning/core/widgets/gradient_border_card.dart';

class CrossingKnowledgeCard extends StatelessWidget {
  const CrossingKnowledgeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientBorderCard(
      borderWidth: 2.0,
      borderRadius: 10.0,
      gradient: const LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [Color(0xFFE35CFF), Color(0xFF3387FF), Color(0xFF25EC77)],
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header row: icon + title
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // App icon
                SvgPicture.asset("assets/icons/shop_icon.svg"),

                SizedBox(width: 14),
                // Title
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Crossing Knowledge -\nPro Edition',
                        style: AppStyle.styleBoldShop16,
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Unlimited lessons, scheduling, \nongoing support, access to all teachers, categories, and bonus content.',
                        style: AppStyle.styleGreyRegularShop14,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            CustomButton(
              text: "Try 2 weeks free - \$10 monthly ",
              textStyle: AppStyle.styleBoldShopButton16,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
