import 'package:flutter/material.dart';

// ── استورد كل الشاشات ────────────────────────────────────────
import 'lessons_match_view.dart';        // P1 - match numbers with pictures
import 'lesson1_view.dart';              // P2 - hear sound match letter
import 'lessons_match_animals_view.dart';// P3 - match animals with words
import 'lessons_match_bodyparts_view.dart';// P4 - match body parts with words
import 'lesson_complete_view.dart';      // Final score screen

// ============================================================
//  LessonFlowView
//  هي الشاشة الأم اللي بتتحكم في ترتيب كل الشاشات
//  وبتجمع السكور من كل شاشة
// ============================================================

class LessonFlowView extends StatefulWidget {
  /// لما الـ lesson كلها تخلص
  final VoidCallback? onLessonFinished;
  static const String routeName = 'lesson_flow_view';

  const LessonFlowView({super.key, this.onLessonFinished});

  @override
  State<LessonFlowView> createState() => _LessonFlowViewState();
}

class _LessonFlowViewState extends State<LessonFlowView> {
  // الشاشة الحالية (0-based)
  int _currentStep = 0;

  // عدد الأسئلة في كل شاشة بالترتيب
  // P1=3, P2=3, P3=3, P4=3
  static const List<int> _stepTotals = [3, 3, 3, 3];
  static const int _totalSteps = 4; // عدد شاشات الأسئلة

  // السكور المتراكم
  int _totalScore = 0;
  int _totalQuestions = 0;

  // السكور والأسئلة في الشاشة الحالية (بيتحدث لحظة بلحظة)
  int _currentStepScore = 0;
  int _currentStepTotal = 0;

  void _onStepFinished(int score, int total) {
    setState(() {
      _totalScore    += score;
      _totalQuestions += total;
      _currentStep++;
      _currentStepScore = 0;
      _currentStepTotal = 0;
    });
  }

  /// بيُستدعى من كل شاشة لتحديث الشريط في real-time
  void _onStepProgress(int score, int total) {
    setState(() {
      _currentStepScore = score;
      _currentStepTotal = total;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _buildCurrentStep();
  }

  Widget _buildCurrentStep() {
    switch (_currentStep) {
      // ── P1: Match numbers with pictures ─────────────────
      case 0:
        return LessonsMatchView(
          totalSteps: _totalSteps,
          currentStep: 0,
          onProgress: (s, t) => _onStepProgress(s, t),
          onFinished: (score) => _onStepFinished(score, _stepTotals[0]),
        );

      // ── P2: Hear sound match letter ──────────────────────
      case 1:
        return Lesson1View(
          totalSteps: _totalSteps,
          currentStep: 1,
          accumulatedScore: _totalScore,
          accumulatedTotal: _totalQuestions,
          onProgress: (s, t) => _onStepProgress(s, t),
          onFinished: (score) => _onStepFinished(score, _stepTotals[1]),
        );

      // ── P3: Match animals with words ─────────────────────
      case 2:
        return LessonsMatchAnimalsView(
          totalSteps: _totalSteps,
          currentStep: 2,
          accumulatedScore: _totalScore,
          accumulatedTotal: _totalQuestions,
          onProgress: (s, t) => _onStepProgress(s, t),
          onFinished: (score) => _onStepFinished(score, _stepTotals[2]),
        );

      // ── P4: Match body parts with words ──────────────────
      case 3:
        return LessonsMatchBodyPartsView(
          totalSteps: _totalSteps,
          currentStep: 3,
          accumulatedScore: _totalScore,
          accumulatedTotal: _totalQuestions,
          onProgress: (s, t) => _onStepProgress(s, t),
          onFinished: (score) => _onStepFinished(score, _stepTotals[3]),
        );

      // ── Final: Lesson Complete ────────────────────────────
      default:
        return LessonCompleteView(
          totalScore: _totalScore,
          totalQuestions: _totalQuestions,
          onContinue: widget.onLessonFinished,
        );
    }
  }
}
