import 'package:flutter/material.dart';

class CustomThumbShape extends SliderComponentShape {
  final double radius;

  const CustomThumbShape({this.radius = 14});

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(radius);
  }
  

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final canvas = context.canvas;

    /// First shadow (big blur)
    final shadow1 = Paint()
      ..color = Colors.black.withOpacity(0.12)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8);

    canvas.drawCircle(center, radius, shadow1);

    /// Second shadow (small blur)
    final shadow2 = Paint()
      ..color = Colors.black.withOpacity(0.12)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 3);

    canvas.drawCircle(center, radius, shadow2);

    /// White thumb circle
    final thumb = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, radius, thumb);
  }
   final double value = 30;
  String formatDuration(double minutes) {
    int m = minutes.round();

    if (m < 60) {
      return "${m}m";
    } else {
      int hours = m ~/ 60;
      int remainingMinutes = m % 60;

      if (remainingMinutes == 0) {
        return "${hours}h";
      }

      return "${hours}h ${remainingMinutes}m";
    }
  }
}