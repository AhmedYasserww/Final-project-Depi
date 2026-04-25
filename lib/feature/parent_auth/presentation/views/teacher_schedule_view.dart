import 'package:flutter/material.dart';
import 'package:kids_education_learning/feature/parent_auth/presentation/views/widgets/teacher_schedule_view_body.dart';

class TeacherScheduleView extends StatelessWidget {
  const TeacherScheduleView({super.key});
  static const String routeName = "TeacherScheduleView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TeacherScheduleViewBody(),
    );
  }
}