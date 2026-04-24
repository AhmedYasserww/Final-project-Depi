import 'package:flutter/material.dart';
import 'package:kids_education_learning/core/utils/app_color.dart';
import 'package:kids_education_learning/feature/parent_auth/presentation/views/widgets/choose_activity_view_body.dart';

class ChooseActivityView extends StatelessWidget {
  const ChooseActivityView({super.key});
  static const String routeName = 'choose-activity';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backGroundColor,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios, size: 24,)) ,

      ),
      body: ChooseActivityViewBody());
  }
}
