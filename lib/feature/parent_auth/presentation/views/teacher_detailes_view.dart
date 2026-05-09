import 'package:flutter/material.dart';
import 'package:kids_education_learning/feature/parent_auth/presentation/views/widgets/teacher_details_view_body.dart';

class TeacherDetailsView extends StatelessWidget {
  const TeacherDetailsView({super.key});
  static const String routeName = 'teacher_Details_View';

  @override
  Widget build(BuildContext context) {
    return TeacherDetailsViewBody();
  }
}