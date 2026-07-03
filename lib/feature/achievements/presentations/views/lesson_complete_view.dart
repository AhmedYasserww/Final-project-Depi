import 'dart:math';
import 'package:flutter/material.dart';
import 'package:kids_education_learning/feature/achievements/presentations/views/widgets/gradient_progress_bar.dart';
class LessonCompleteView extends StatefulWidget {
  /// مجموع الإجابات الصح من كل الشاشات
  final int totalScore;

  /// مجموع الأسئلة الكلية من كل الشاشات
  final int totalQuestions;

  /// لما يضغط Continue
  final VoidCallback? onContinue;

  const LessonCompleteView({
    super.key,
    required this.totalScore,
    required this.totalQuestions,
    this.onContinue,
  });

  @override
  State<LessonCompleteView> createState() => _LessonCompleteViewState();
}

class _LessonCompleteViewState extends State<LessonCompleteView>
    with TickerProviderStateMixin {
  late final AnimationController _circleCtrl;
  late final AnimationController _confettiCtrl;
  late final Animation<double> _circleAnim;

  int get _percentage =>
      widget.totalQuestions == 0
          ? 0
          : ((widget.totalScore / widget.totalQuestions) * 100).round();

  @override
  void initState() {
    super.initState();

    _circleCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _circleAnim = Tween<double>(begin: 0, end: _percentage / 100)
        .animate(CurvedAnimation(parent: _circleCtrl, curve: Curves.easeOut));

    _confettiCtrl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    Future.delayed(const Duration(milliseconds: 300), () {
      _circleCtrl.forward();
      _confettiCtrl.forward();
    });
  }

  @override
  void dispose() {
    _circleCtrl.dispose();
    _confettiCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F9FD),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Header ──────────────────────────────────────
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Lesson complete!",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF000846),
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    "Well done! Keep up the good work",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(height: 16),
                  // الشريط الملون كامل 100% عشان الليسون خلصت
                  GradientProgressBar(
                    totalSteps: 1,
                    currentStep: 0,
                    stepScore: 1,
                    stepTotal: 1,
                  ),
                ],
              ),
            ),

            const Spacer(),

            // ── Score card + confetti ────────────────────────
            Stack(
              alignment: Alignment.center,
              children: [
                // Confetti particles
                AnimatedBuilder(
                  animation: _confettiCtrl,
                  builder: (_, __) => CustomPaint(
                    size: const Size(double.infinity, 400),
                    painter: _ConfettiPainter(_confettiCtrl.value),
                  ),
                ),

                // Score card
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  padding: const EdgeInsets.all(28),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(28),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.06),
                        blurRadius: 20,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      // ── Circular progress ──────────────
                      AnimatedBuilder(
                        animation: _circleAnim,
                        builder: (_, __) {
                          final pct =
                              (_circleAnim.value * 100).round();
                          return SizedBox(
                            width: 160,
                            height: 160,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                CustomPaint(
                                  size: const Size(160, 160),
                                  painter: _CirclePainter(
                                      _circleAnim.value),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      '$pct%',
                                      style: const TextStyle(
                                        fontSize: 36,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF000846),
                                      ),
                                    ),
                                    const Text(
                                      'Awesome job!',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xFF5C6BC0),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),

                      const SizedBox(height: 24),

                      // ── Achievement row ────────────────
                      Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFF8E1),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFE082),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Icon(
                                Icons.emoji_events,
                                color: Color(0xFFFF8F00),
                                size: 28,
                              ),
                            ),
                            const SizedBox(width: 14),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Achievement earned!',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Color(0xFF000846),
                                  ),
                                ),
                                SizedBox(height: 2),
                                Text(
                                  'Completed your first lesson',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const Spacer(),

            // ── Continue button ──────────────────────────────
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: widget.onContinue,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF5C6BC0),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'continue',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Circular arc painter ─────────────────────────────────────
class _CirclePainter extends CustomPainter {
  final double progress;
  _CirclePainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 10;

    // Track
    canvas.drawCircle(
      center,
      radius,
      Paint()
        ..color = Colors.grey.shade200
        ..style = PaintingStyle.stroke
        ..strokeWidth = 12,
    );

    // Gradient arc
    final rect = Rect.fromCircle(center: center, radius: radius);
    final paint = Paint()
      ..shader = const SweepGradient(
        startAngle: -pi / 2,
        endAngle: 3 * pi / 2,
        colors: [
          Color(0xFF7C4DFF),
          Color(0xFFE040FB),
          Color(0xFFFF80AB),
        ],
      ).createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 12
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      rect,
      -pi / 2,
      2 * pi * progress,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(_CirclePainter old) => old.progress != progress;
}

// ── Confetti painter ─────────────────────────────────────────
class _ConfettiPainter extends CustomPainter {
  final double progress;
  final List<_Particle> _particles;

  _ConfettiPainter(this.progress)
      : _particles = List.generate(60, (i) => _Particle(i));

  @override
  void paint(Canvas canvas, Size size) {
    for (final p in _particles) {
      final x = p.x * size.width;
      final y = p.startY * size.height +
          progress * p.speed * size.height -
          0.1 * size.height;
      if (y > size.height || y < 0) continue;

      final paint = Paint()..color = p.color.withOpacity(1 - progress * 0.5);

      if (p.isRect) {
        canvas.save();
        canvas.translate(x, y);
        canvas.rotate(progress * p.rotation);
        canvas.drawRect(
          Rect.fromCenter(center: Offset.zero, width: p.size, height: p.size * 0.4),
          paint,
        );
        canvas.restore();
      } else {
        canvas.drawCircle(Offset(x, y), p.size * 0.35, paint);
      }
    }
  }

  @override
  bool shouldRepaint(_ConfettiPainter old) => old.progress != progress;
}

class _Particle {
  late final double x;
  late final double startY;
  late final double speed;
  late final double size;
  late final double rotation;
  late final Color color;
  late final bool isRect;

  static final _rng = Random(42);
  static const _colors = [
    Color(0xFFFF4081), Color(0xFF7C4DFF), Color(0xFF00BFA5),
    Color(0xFFFFD740), Color(0xFF69F0AE), Color(0xFF40C4FF),
    Color(0xFFFF6D00), Color(0xFF304FFE),
  ];

  _Particle(int seed) {
    final rng = Random(seed * 17 + 3);
    x        = rng.nextDouble();
    startY   = rng.nextDouble() * 0.4 - 0.2;
    speed    = 0.4 + rng.nextDouble() * 0.6;
    size     = 6 + rng.nextDouble() * 10;
    rotation = (rng.nextDouble() - 0.5) * 6;
    color    = _colors[rng.nextInt(_colors.length)];
    isRect   = rng.nextBool();
  }
}
