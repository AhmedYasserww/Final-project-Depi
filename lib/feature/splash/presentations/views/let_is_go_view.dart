import 'package:flutter/material.dart';
import 'package:kids_education_learning/feature/splash/presentations/views/widgets/let_is_go_view_body.dart';

class LetIsGoView extends StatelessWidget {
  const LetIsGoView({super.key, required this.isTeacher});

  final bool isTeacher;

  static const String routeName = "let_is_go_view";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEBEBEB),
      body: LetIsGoViewBody(isTeacher: isTeacher),
    );
  }
}