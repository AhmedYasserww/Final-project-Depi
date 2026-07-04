import 'package:flutter/material.dart';
import 'widgets/profile_parent_view_body.dart';

class ProfileParentView extends StatelessWidget {
  const ProfileParentView({super.key});
static const String routeName = 'profile_parent_view';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: ProfileParentViewBody()),
    );
  }
}