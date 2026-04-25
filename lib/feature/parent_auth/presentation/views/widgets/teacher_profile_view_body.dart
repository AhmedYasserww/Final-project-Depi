import 'package:flutter/material.dart';
import 'package:kids_education_learning/core/utils/app_color.dart';
import 'package:kids_education_learning/core/utils/app_style.dart';
import 'package:kids_education_learning/core/widgets/profile_widgets/custom_icon_button.dart';
import 'package:kids_education_learning/core/widgets/profile_widgets/custom_tab_button.dart';
import 'package:kids_education_learning/core/widgets/profile_widgets/custom_stat_card.dart';
import 'package:kids_education_learning/core/widgets/profile_widgets/custom_session_card.dart';

class TeacherProfileViewBody extends StatefulWidget {
  const TeacherProfileViewBody({super.key});
  @override
  State<TeacherProfileViewBody> createState() => _TeacherProfileViewBodyState();
}

class _TeacherProfileViewBodyState extends State<TeacherProfileViewBody> {
  int _selectedTab = 0;
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
              /// Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Profile',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      color: AppColors.blackColor,
                      fontFamily: 'Inter',
                    ),
                  ),
                  Row(
                    children: [
                      CustomIconButton(icon: Icons.edit_outlined),
                      SizedBox(width: 8),
                      CustomIconButton(icon: Icons.settings_outlined),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30),
              /// Avatar
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  width: 100,
                  height: 100,
                  color: const Color(0xFFB0A8D9),
                  child: const Icon(
                    Icons.person,
                    size: 80,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 12),

              /// Name
              Row(
                children: const [
                  Text(
                    'Sarah Eastwood',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: AppColors.labelTextColor,
                      fontFamily: 'Inter',
                    ),
                  ),
                  SizedBox(width: 6),
                  Text('🇦🇺', style: TextStyle(fontSize: 16)),
                ],
              ),

              const SizedBox(height: 4),
              Text(
                '\$80/hr',
                style: AppStyle.styleBoldShop16,
              ),
              const SizedBox(height: 16),

              /// Tabs
              Row(
                children: [
                  CustomTabButton(
                    label: 'Overview',
                    isSelected: _selectedTab == 0,
                    onTap: () => setState(() => _selectedTab = 0),
                  ),
                  const SizedBox(width: 10),
                  CustomTabButton(
                    label: 'Reviews',
                    badge: '19',
                    isSelected: _selectedTab == 1,
                    onTap: () => setState(() => _selectedTab = 1),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              /// Stats
              Row(
                children: [
                  Expanded(
                    child: CustomStatCard(
                      value: '3',
                      label: 'Lessons completed',
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
                    child: CustomStatCard(
                      value: '10',
                      label: 'Scheduled lessons',
                      icon: const Icon(
                        Icons.calendar_today_outlined,
                        color: AppColors.darkBlueColor,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 25),

              /// Bio
              Text(
                'I am a passionate early childhood educator dedicated to nurturing young minds and fostering a love for learning. With 5 years of experience, I specialize in...',
                style: AppStyle.styleGreyRegular16,
              ),

              const SizedBox(height: 6),
              GestureDetector(
                onTap: () {},
                child: const Text(
                  'Show more',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryColor,
                    fontFamily: 'Inter',
                  ),
                ),
              ),

              const SizedBox(height: 20),
              const Divider(
                color: Color(0xFFE0E0E0),
                thickness: 1,
              ),

              const SizedBox(height: 20),
              /// Available Sessions
              const Text(
                'Available sessions',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: AppColors.labelTextColor,
                  fontFamily: 'Inter',
                ),
              ),

              const SizedBox(height: 6),
              Text(
                'These are the session times your clients can book.',
                style: AppStyle.styleGreyRegular16,
              ),

              const SizedBox(height: 16),
              /// Session Cards
              const Row(
                children: [
                  Expanded(
                    child: CustomSessionCard(
                      duration: '30 minutes',
                      label: 'Lesson',
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: CustomSessionCard(
                      duration: '1 hour',
                      label: 'Lesson',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}