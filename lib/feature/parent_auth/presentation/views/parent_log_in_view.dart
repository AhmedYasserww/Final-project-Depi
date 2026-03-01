import 'package:flutter/material.dart';
import 'package:kids_education_learning/feature/parent_auth/presentation/views/widgets/parent_log_in_view_body.dart';
class ParentLogInView extends StatelessWidget {
  const ParentLogInView({super.key});
static const String routeName = 'parent_logIn_View';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: ParentLogInViewBody(),
    );
  }
}
