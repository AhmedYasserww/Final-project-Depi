import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kids_education_learning/core/utils/app_style.dart';

class CourseUploadedDialog extends StatefulWidget {
  const CourseUploadedDialog({super.key});

  @override
  State<CourseUploadedDialog> createState() => _CourseUploadedDialogState();
}

class _CourseUploadedDialogState extends State<CourseUploadedDialog> {
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
            ),
            const SizedBox(height: 12),
            const Text(
              'Course Uploaded!',
              style: AppStyle.styleScheduleSemiBold17,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}