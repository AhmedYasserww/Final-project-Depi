import 'package:flutter/material.dart';
import 'package:kids_education_learning/core/utils/app_color.dart';
import 'package:kids_education_learning/feature/parent_auth/presentation/views/widgets/lessons_view_body.dart';

class LessonsView extends StatelessWidget {
  const LessonsView({super.key});
  static const String routeName = "lessons_view";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: LessonsViewBody(),
    );
  }
}