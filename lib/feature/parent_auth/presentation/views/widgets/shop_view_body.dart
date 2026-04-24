import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kids_education_learning/core/widgets/custom_shop_card2.dart';
import 'package:kids_education_learning/core/widgets/custome_shop_card1.dart';
import '../../../../../core/utils/app_style.dart';

class ShopViewBody extends StatelessWidget {
  const ShopViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  // Title
                  const Text('Shop', style: AppStyle.styleBold32),
                  const SizedBox(height: 8),
                  const Text(
                    'Discover suitable learning options for your \nchild.',
                    style: AppStyle.styleGreyRegular16,
                  ),
                  const SizedBox(height: 28),

                  // Pro Edition Card (gradient border)
                  CrossingKnowledgeCard(),

                  const SizedBox(height: 16),

                  // All Teachers Card
                  ShopCard(
                    icon: SvgPicture.asset(
                      "assets/icons/teacher_shop_icon.svg",
                    ),
                    title: 'All Teachers',
                    subtitle: 'Unlock access to over 500 teachers.',
                    buttonText: 'Buy for \$14.99',
                  ),

                  const SizedBox(height: 16),

                  // All Categories Card
                  ShopCard(
                    icon: SvgPicture.asset(
                      "assets/icons/category_shop_icon.svg",
                    ),
                    title: 'All Categories',
                    subtitle: 'Unlock access to all categories available.',
                    buttonText: 'Buy for \$14.99',
                  ),

                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

