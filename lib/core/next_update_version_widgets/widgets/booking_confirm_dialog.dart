import 'package:flutter/material.dart';
import 'package:kids_education_learning/core/utils/app_style.dart';

class BookingConfirmedDialog extends StatelessWidget {
  const BookingConfirmedDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 40),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      backgroundColor: Colors.white,
      child: SizedBox(
        width: double.infinity,
        height: 151,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 48,
              width: 48,
              child: Image.asset("assets/images/booking_confirmed.png"),
            ),
            const SizedBox(width: 12),
            const Text(
              'Booking confirmed!',
              style: AppStyle.styleScheduleSemiBold17,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
