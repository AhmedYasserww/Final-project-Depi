import 'package:flutter/material.dart';
import 'package:kids_education_learning/core/utils/app_color.dart';
import 'package:kids_education_learning/feature/parent_auth/presentation/views/widgets/choose_activity_view_body.dart';

class ChooseActivityView extends StatefulWidget {
  const ChooseActivityView({super.key});

  @override
  State<ChooseActivityView> createState() => _ChooseActivityViewState();
}

class _ChooseActivityViewState extends State<ChooseActivityView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backGroundColor,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios, size: 24,)),
            Text("Back", style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w400,
              letterSpacing: -0.43,
            ),),
          ],
        ),
        centerTitle: false,
        
      ),
      body: ChooseActivityViewBody());
  }
}
