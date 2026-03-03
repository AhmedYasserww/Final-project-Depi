import 'package:flutter/material.dart';

class CustomSubtitleText extends StatelessWidget {
  final String text;
  final double fontSize;

  const CustomSubtitleText({
    super.key,
    required this.text,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: const Color(0xFF707070),
        fontSize: fontSize,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}