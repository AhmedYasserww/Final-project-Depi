import 'package:flutter/material.dart';
import 'package:kids_education_learning/core/utils/app_color.dart';
import 'package:kids_education_learning/feature/parent_auth/presentation/views/widgets/choose_goal_view_body.dart';

class ChooseGoalView extends StatelessWidget {
  const ChooseGoalView({super.key});
  static const String routeName = "choose_goal_view";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backGroundColor,
      leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios, size: 24,)) ,

      ),
      body: ChooseGoalViewBody());
  }
}
