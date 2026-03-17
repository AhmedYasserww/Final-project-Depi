import 'package:flutter/material.dart';
import 'package:kids_education_learning/core/widgets/gradient_border_painter.dart';

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
      painter: GradientBorderPainter(
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
