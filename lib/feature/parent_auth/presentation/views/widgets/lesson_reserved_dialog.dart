import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kids_education_learning/core/utils/app_style.dart';

class LessonReservedDialog extends StatefulWidget {
  const LessonReservedDialog({super.key});

  @override
  State<LessonReservedDialog> createState() => _LessonReservedDialogState();
}

class _LessonReservedDialogState extends State<LessonReservedDialog> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      if (mounted) Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 40),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              "assets/images/booking_confirmed.png",
              width: 48,
              height: 48,
            ),
            const SizedBox(height: 12),
            const Text(
              'Lesson Reserved!',
              style: AppStyle.styleScheduleSemiBold17,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}