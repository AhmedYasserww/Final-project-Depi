import 'package:flutter/material.dart';

class CircularProfileImage extends StatelessWidget {
  final String imagePath;

  const CircularProfileImage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 94,
      height: 94,
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 23),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(color: const Color(0xFFDFDFDF), width: 1),
      ),
      child: Center(child: Image.asset(imagePath, fit: BoxFit.contain)),
    );
  }
}
