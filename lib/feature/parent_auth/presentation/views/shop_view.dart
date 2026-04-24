import 'package:flutter/material.dart';
import 'package:kids_education_learning/core/utils/app_color.dart';
import 'package:kids_education_learning/feature/parent_auth/presentation/views/widgets/shop_view_body.dart';

class ShopView extends StatelessWidget {
  const ShopView({super.key});

  static const String routeName = "ShopView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: ShopViewBody(),
    );
  }
}