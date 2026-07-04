import 'package:flutter/material.dart';

/// الشريط الملون المشترك بين كل الشاشات
/// [totalSteps]  = عدد الخطوات الكلية (عدد الشاشات)
/// [currentStep] = الشاشة الحالية (0-based)
/// [stepScore]   = الإجابات الصح في الشاشة الحالية
/// [stepTotal]   = عدد الأسئلة في الشاشة الحالية
class GradientProgressBar extends StatelessWidget {
  final int totalSteps;
  final int currentStep;
  final int stepScore;
  final int stepTotal;

  const GradientProgressBar({
    super.key,
    required this.totalSteps,
    required this.currentStep,
    required this.stepScore,
    required this.stepTotal,
  });

  /// النسبة الكلية = (الشاشات اللي خلصت + نسبة الشاشة الحالية) / عدد الشاشات
  double get _fraction {
    final completedSteps = currentStep.toDouble();
    final currentFraction = stepTotal == 0 ? 0.0 : stepScore / stepTotal;
    return ((completedSteps + currentFraction) / totalSteps).clamp(0.0, 1.0);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 6,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        AnimatedFractionallySizedBox(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeOut,
          widthFactor: _fraction,
          child: Container(
            height: 6,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF00E5FF),
                  Color(0xFF00BFA5),
                  Color(0xFF7C4DFF),
                  Color(0xFFFF4081),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
