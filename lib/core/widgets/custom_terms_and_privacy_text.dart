import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class TermsAndPrivacyText extends StatelessWidget {
  final VoidCallback? onTermsTap;
  final VoidCallback? onPrivacyTap;

  const
  TermsAndPrivacyText({
    super.key,
    this.onTermsTap,
    this.onPrivacyTap,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.start,
      text: TextSpan(
        style: TextStyle(

          fontSize: 12,
          color: Color(0xff707070),
          height: 1.5,
        ),
        children: [
          const TextSpan(
            text:
            "By continuing, you agree with Crossing Knowledge’s ",
            style: TextStyle(fontWeight: FontWeight.w400),
          ),
          TextSpan(
            text: "Terms of Service",
            style: const TextStyle(
              color: Color(0xFF343B6E),
              fontWeight: FontWeight.w500,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = onTermsTap,
          ),
          const TextSpan(
            text: " and ",
            style: TextStyle(fontWeight: FontWeight.w400),
          ),
          TextSpan(
            text: "Privacy Policy",
            style: const TextStyle(
              color: Color(0xFF343B6E),
              fontWeight: FontWeight.w500,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = onPrivacyTap,
          ),
          const TextSpan(
            text: ".",
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}