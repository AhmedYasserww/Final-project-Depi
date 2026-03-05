import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashView(),
    );
  }
}

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    _controller.forward();

    /// بعد 4 ثواني ينتقل للصفحة التالية
    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const NextPage(),
        ),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffD6D6D6),
      body: Stack(
        children: [

          /// الخلفية
          Positioned.fill(
            child: Image.asset(
              'images/tile_background (1) 1.jpg',
              fit: BoxFit.cover,
            ),
          ),

          /// اللوجو مع أنيميشن
          Positioned(
            top: 368,
            left: 90,
            child: FadeTransition(
              opacity: _animation,
              child: ScaleTransition(
                scale: _animation,
                child: Container(
                  width: 213,
                  height: 116,
                  decoration: BoxDecoration(
                    color: const Color(0xffD6D6D6),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Image.asset(
                    'images/Crossing Knowledge.jpg',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
/// الصفحة اللي بعد السبلاتش
class NextPage extends StatelessWidget {
  const NextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Next Page",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}