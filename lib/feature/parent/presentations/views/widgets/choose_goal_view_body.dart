import 'package:flutter/material.dart';
import 'package:kids_education_learning/core/utils/app_color.dart';
import 'package:kids_education_learning/core/widgets/custom_button.dart';

import '../../../../auth/presentaions/auth_parent/presentaitions/views/choose_activity_view.dart';
import '../../../../auth/presentaions/auth_parent/presentaitions/views/widgets/custom_goal_button.dart';

class ChooseGoalViewBody extends StatefulWidget {
  const ChooseGoalViewBody({super.key});

  @override
  State<ChooseGoalViewBody> createState() => _ChooseGoalViewBodyState();
}

class _ChooseGoalViewBodyState extends State<ChooseGoalViewBody> {
  final Set<String> _selectedGoals = {};

  void _toggleGoal(String goal) {
    setState(() {
      if (_selectedGoals.contains(goal)) {
        _selectedGoals.remove(goal);
      } else {
        _selectedGoals.add(goal);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backGroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 20, bottom: 24),
            child: Text(
              "Choose a goal",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryTextColor,
                letterSpacing: -.02,
              ),
            ),
          ),
          CustomGoalButton(
            leading: "Breeze",
            trailing: "Less than 1h",
            isSelected: _selectedGoals.contains("Breeze"),
            onTap: () => _toggleGoal("Breeze"),
          ),
          CustomGoalButton(
            leading: "Casual",
            trailing: " 1h",
            isSelected: _selectedGoals.contains("Casual"),
            onTap: () => _toggleGoal("Casual"),
          ),
          CustomGoalButton(
            leading: "Regular",
            trailing: "2h",
            isSelected: _selectedGoals.contains("Regular"),
            onTap: () => _toggleGoal("Regular"),
          ),
          CustomGoalButton(
            leading: "Focused",
            trailing: "4h",
            isSelected: _selectedGoals.contains("Focused"),
            onTap: () => _toggleGoal("Focused"),
          ),
          CustomGoalButton(
            leading: "Intense",
            trailing: "More than 4hrs",
            isSelected: _selectedGoals.contains("Intense"),
            onTap: () => _toggleGoal("Intense"),
          ),

          Spacer(),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 40),
            child: CustomButton(
              text: "continue",
              onTap: _selectedGoals.isEmpty
                  ? () {}
                  : () {
                      Navigator.of(context).pushNamed(
                        ChooseActivityView.routeName,
                      );
                    },
              buttonColor: _selectedGoals.isEmpty
                  ? Colors.grey
                  : AppColors.buttonColor,
            ),
          ),
        ],
      ),
    );
  }
}