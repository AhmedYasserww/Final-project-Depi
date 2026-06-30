import 'package:flutter/material.dart';
import 'package:kids_education_learning/core/utils/app_color.dart';
import 'package:kids_education_learning/core/utils/app_images.dart';

import 'package:kids_education_learning/core/widgets/custom_stat_card.dart';
import 'package:kids_education_learning/core/widgets/custom_category_card.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  static const stats = [
    ['1', 'Lesson(s)\nin progress', Icons.rocket_launch, Colors.red],
    ['10', 'Lessons\ncompleted', Icons.check_circle, Colors.green],
    ['4', 'Categories\ncompleted', Icons.grid_view_rounded, Colors.deepPurple],
    ['5', 'Achievements', Icons.emoji_events, Colors.amber],
  ];

  static const lessons = [
    ['A-E-I-O-U', AppImages.cracterA],
    ['Mixing \nColours', AppImages.frame],
    ['Matching \nNumbers', AppImages.numbers],
    ['Super \nShapes', AppImages.cardShapes],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: SafeArea(
        child: Column(
          children: [

            /// HEADER
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Flexible(
                    child: Text(
                      'Overview',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF343B6E),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: const Color(0xFFD9D9D9),
                        width: 1.2,
                      ),
                    ),
                    child: const Icon(
                      Icons.notifications,
                      color: Color(0xFF343B6E),
                      size: 24,
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      const SizedBox(height: 8),

                      /// STATS GRID
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: stats.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          childAspectRatio: 1.4,
                        ),
                        itemBuilder: (context, index) {
                          final e = stats[index];
                          return CustomStatCard(
                            value: e[0] as String,
                            desc: e[1] as String,
                            icon: e[2] as IconData,
                            color: e[3] as Color,
                          );
                        },
                      ),

                      const SizedBox(height: 32),

                      const Text(
                        'Lessons',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF343B6E),
                        ),
                      ),

                      const SizedBox(height: 4),

                      const Text(
                        'Choose a category to begin a lesson.',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 17,
                          color: Color(0xFF7A7A7A),
                        ),
                      ),

                      const SizedBox(height: 16),

                      /// LESSONS GRID
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: lessons.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 1.6,
                        ),
                        itemBuilder: (context, index) {
                          final e = lessons[index];
                          return CustomCategoryCard(
                            title: e[0] as String,
                            icon: e[1] as String,
                          );
                        },
                      ),

                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}