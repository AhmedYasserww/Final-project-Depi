import 'package:flutter/material.dart';
import 'package:kids_education_learning/core/utils/app_color.dart';
import 'package:kids_education_learning/core/widgets/custom_activity_button.dart';
import 'package:kids_education_learning/core/widgets/custom_button.dart';
import 'package:kids_education_learning/feature/parent_auth/presentation/views/let_is_go_view.dart';

class ChooseActivityViewBody extends StatefulWidget {
  const ChooseActivityViewBody({super.key});

  @override
  State<ChooseActivityViewBody> createState() =>
      _ChooseActivityViewBodyState();
}

class _ChooseActivityViewBodyState extends State<ChooseActivityViewBody> {
  final Set<String> _selectedActivities = {};

  void _toggleActivity(String activity) {
    setState(() {
      if (_selectedActivities.contains(activity)) {
        _selectedActivities.remove(activity);
      } else {
        _selectedActivities.add(activity);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final activities = [
      "Storytelling",
      "Alphabet Games",
      "Rhyming Games",
      "Counting Games",
      "Shapes and Colors",
      "Drawing and Colouring",
      "All of the above",
    ];

    return Container(
      color: AppColors.backGroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 20, bottom: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Choose activities",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryTextColor,
                    letterSpacing: -.02,
                  ),
                ),
                Text(
                  "These will be shown in the lessons.",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF707070),
                    letterSpacing: -.02,
                  ),
                ),
              ],
            ),
          ),

          for (final activity in activities)
            CustomActivityButton(
              leading: activity,
              isSelected: _selectedActivities.contains(activity),
              onTap: () => _toggleActivity(activity),
            ),

          Spacer(),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 40),
            child: CustomButton(
              text: "continue",
              onTap: _selectedActivities.isEmpty
                  ? () {}
                  : () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const LetIsGoView(isTeacher: false),
                  ),
                );
              },
              buttonColor: _selectedActivities.isEmpty
                  ? Colors.grey
                  : AppColors.buttonColor,
            ),
          ),
        ],
      ),
    );
  }
}