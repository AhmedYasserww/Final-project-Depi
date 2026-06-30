import 'package:flutter/material.dart';
import 'package:kids_education_learning/feature/parent_auth/presentation/views/widgets/let_is_go_view_body.dart';

class LetIsGoView extends StatelessWidget {
  const LetIsGoView({super.key});
  static const String routeName = "let_is_go_view";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEBEBEB),
      body: LetIsGoViewBody(),
    );
  }
}