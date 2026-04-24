import 'package:flutter/material.dart';
import 'package:kids_education_learning/core/utils/app_color.dart';
import 'package:kids_education_learning/core/widgets/custom_button.dart';
import 'package:kids_education_learning/core/widgets/custom_goal_button.dart';
import 'package:kids_education_learning/feature/parent_auth/presentation/views/choose_activity_view.dart';

class ChooseGoalViewBody extends StatefulWidget {
  const ChooseGoalViewBody({super.key});

  @override
  State<ChooseGoalViewBody> createState() => _ChooseGoalViewBodyState();
}

class _ChooseGoalViewBodyState extends State<ChooseGoalViewBody> {
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
          CustomGoalButton(leading: "Breeze",trailing: "Less than 1h"),
          CustomGoalButton(leading: "Casual",trailing: " 1h"),
          CustomGoalButton(leading: "Regular",trailing: "2h"),
          CustomGoalButton(leading: "Focused",trailing: "4h"),
          CustomGoalButton(leading: "Intense",trailing: "More than 4hrs"),
      
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 40),
            child:
            CustomButton(text: "continue",
                onTap: () {
            Navigator.of(context).pushNamed(ChooseActivityView.routeName);
            }),
          ),
          
        ],
      ),
    );
  }
}
