import 'package:flutter/material.dart';
import 'package:kids_education_learning/core/utils/app_color.dart';
import 'package:kids_education_learning/core/widgets/custom_activity_button.dart';
import 'package:kids_education_learning/core/widgets/custom_button.dart';
import 'package:kids_education_learning/feature/parent_auth/presentation/views/let_is_go_view.dart';

class ChooseActivityViewBody extends StatefulWidget {
  const ChooseActivityViewBody({super.key});

  @override
  State<ChooseActivityViewBody> createState() => _ChooseActivityViewBodyState();
}

class _ChooseActivityViewBodyState extends State<ChooseActivityViewBody> {
  @override
  Widget build(BuildContext context) {
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

          CustomActivityButton(leading: "Storytelling"),
          CustomActivityButton(leading: "Alphabet Games"),
          CustomActivityButton(leading: "Rhyming Games"),
          CustomActivityButton(leading: "Counting Games"),
          CustomActivityButton(leading: "Shapes and Colors"),
          CustomActivityButton(leading: "Drawing and Colouring"),
          CustomActivityButton(leading: "All of the above"),

          Spacer(),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 40),
            child: CustomButton(text: "continue", onTap: () {
            Navigator.of(context).pushNamed(LetIsGoView.routeName);
            }),
          ),
        ],
      ),
    );
  }
}
