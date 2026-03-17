import 'package:flutter/material.dart';
import 'package:kids_education_learning/feature/parent_auth/presentation/views/widgets/teacher_profile_view_body.dart';

class TeacherProfileView extends StatelessWidget {
  const TeacherProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: TeacherProfileViewBody(),
    );
  }
}