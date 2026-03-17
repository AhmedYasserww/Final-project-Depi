import 'package:flutter/material.dart';
import 'package:kids_education_learning/core/utils/app_color.dart';
import 'package:kids_education_learning/core/utils/app_style.dart';
import 'package:kids_education_learning/core/widgets/custom_lesson_card_father.dart';
import 'package:kids_education_learning/core/widgets/custom_stat_card_father.dart';

class ScheduledLessonsBody extends StatelessWidget {
  const ScheduledLessonsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Overview',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      color: AppColors.darkBlueColor,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: AppColors.borderColor,
                        width: 1.2,
                      ),
                    ),
                    child: const Icon(
                      Icons.notifications,
                      color: AppColors.darkBlueColor,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              /// ✅ Stat Cards
              IntrinsicHeight(
                child: Row(
                  children: [
                    Expanded(
                      child: StatCard(
                        value: '3',
                        label: 'Lesson completed',
                        icon: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: const BoxDecoration(
                            color: Color(0xFF4CAF50),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 12),

                    Expanded(
                      child: StatCard(
                        value: '10',
                        label: 'Scheduled lessons',
                        icon: const Icon(
                          Icons.calendar_today_outlined,
                          color: AppColors.darkBlueColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              Text(
                'Scheduled Lessons',
                style: AppStyle.styleBold20.copyWith(
                  fontSize: 22,
                  color: AppColors.darkBlueColor,
                ),
              ),

              const SizedBox(height: 16),

              const SectionLabel(label: 'Today'),
              const SizedBox(height: 8),

              const CustomLessonCardFather(
                name: 'Jacob',
                mode: 'Virtual (Online)',
                date: '09/11/24',
                duration: '30 minutes',
                category: 'Mixed',
              ),

              const SizedBox(height: 16),
              const SectionLabel(label: 'Tomorrow'),
              const SizedBox(height: 8),

              const CustomLessonCardFather(
                name: 'Amy',
                mode: 'Virtual (Online)',
                date: '10/11/24',
                duration: '1hr',
                category: 'Super Shapes',
              ),
              const SizedBox(height: 12),
              const CustomLessonCardFather(
                name: 'Henry',
                mode: 'Virtual (Online)',
                date: '10/11/24',
                duration: '1hr',
                category: 'Matching numbers',
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class SectionLabel extends StatelessWidget {
  final String label;

  const SectionLabel({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: AppStyle.styleGreyMedium14,
    );
  }
}