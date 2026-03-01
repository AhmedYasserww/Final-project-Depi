import 'package:flutter/material.dart';

import '../utils/app_style.dart';
class CustomEmptyScreen extends StatelessWidget {
  final String message;
  const CustomEmptyScreen({
    super.key, required this.message,
  });

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Text(
        message,
        style:AppStyle.styleBold18.copyWith(color: Colors.grey),
      )
    );
  }
}
