import 'package:flutter/material.dart';
import 'package:kids_education_learning/feature/teacher/presentations/views/widgets/teacher_profile_view_body.dart';

class TeacherProfileView extends StatelessWidget {
  const TeacherProfileView({super.key});

  static const String routeName = "TeacherProfileView";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: TeacherProfileViewBody(),
    );
  }
}