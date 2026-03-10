

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kids_education_learning/core/utils/app_style.dart';
import 'package:kids_education_learning/core/widgets/custom_button.dart';

class CrossingKnowledgeCard extends StatelessWidget {
  const CrossingKnowledgeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientBorderCard(
      borderWidth: 2.0,
      borderRadius: 10.0,
      gradient: const LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [Color(0xFFE35CFF), Color(0xFF3387FF), Color(0xFF25EC77)],
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header row: icon + title
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // App icon
                SvgPicture.asset("assets/icons/shop_icon.svg"),

                SizedBox(width: 14),
                // Title
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Crossing Knowledge -\nPro Edition',
                        style: AppStyle.styleBoldShop16,
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Unlimited lessons, scheduling, \nongoing support, access to all teachers, categories, and bonus content.',
                        style: AppStyle.styleGreyRegularShop14,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            CustomButton(
              text: "Try 2 weeks free - \$10 monthly ",
              textStyle: AppStyle.styleBoldShopButton16,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class GradientBorderCard extends StatelessWidget {
  final Widget child;
  final double borderWidth;
  final double borderRadius;
  final Gradient gradient;
  final Color backgroundColor;

  const GradientBorderCard({
    super.key,
    required this.child,
    required this.gradient,
    this.borderWidth = 2.0,
    this.borderRadius = 20.0,
    this.backgroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _GradientBorderPainter(
        gradient: gradient,
        borderWidth: borderWidth,
        borderRadius: borderRadius,
        backgroundColor: backgroundColor,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: Container(
          decoration: BoxDecoration(
            // Subtle inner gradient to match the card background
            gradient: const LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Color(0xFFfdf7ff), Color(0xFFf5fffa)],
            ),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: child,
        ),
      ),
    );
  }
}

class _GradientBorderPainter extends CustomPainter {
  final Gradient gradient;
  final double borderWidth;
  final double borderRadius;
  final Color backgroundColor;

  _GradientBorderPainter({
    required this.gradient,
    required this.borderWidth,
    required this.borderRadius,
    required this.backgroundColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final rRect = RRect.fromRectAndRadius(rect, Radius.circular(borderRadius));

    // Draw gradient border
    final borderPaint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;

    canvas.drawRRect(rRect, borderPaint);
  }

  @override
  bool shouldRepaint(_GradientBorderPainter oldDelegate) =>
      oldDelegate.gradient != gradient ||
      oldDelegate.borderWidth != borderWidth ||
      oldDelegate.borderRadius != borderRadius;
}
