import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CustomFreePlanCard extends StatelessWidget {
  final VoidCallback onShopTap;

  const CustomFreePlanCard({super.key, required this.onShopTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Color(0xFFF8F8F8),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFF343B6E),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              'FREE',
              style: TextStyle(
                color: Color(0xFFFFFFFF),
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text.rich(
              TextSpan(
                text: "You’re on the free plan.\nVisit the ",
                style: const TextStyle(
                  color: Color(0xFF000846),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  // height: 1.4,
                ),
                children: [
                  TextSpan(
                    text: "shop",
                    style: const TextStyle(
                      color: Color(0xFF343B6E),
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w500,
                    ),
                    recognizer: TapGestureRecognizer()..onTap = onShopTap,
                  ),
                  const TextSpan(text: " to upgrade."),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
