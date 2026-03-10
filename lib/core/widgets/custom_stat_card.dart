import 'package:flutter/material.dart';

class CustomStatCard extends StatelessWidget {
  const CustomStatCard({
    super.key,
    required this.value,
    required this.desc,
    required this.icon,
    required this.color,
  });

  final String value;
  final String desc;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: _box(),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(value,
                  style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF343B6E))),
              Text(desc,
                  style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF343B6E))),
            ],
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Icon(icon, color: color, size: 24),
          )
        ],
      ),
    );
  }

  BoxDecoration _box({double borderWidth = 1.2}) {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: const Color(0xFFD9D9D9), width: borderWidth),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          offset: const Offset(0, 8),
          blurRadius: 18,
        ),
        BoxShadow(
          color: Colors.black.withOpacity(0.01),
          offset: const Offset(0, 3),
          blurRadius: 6,
        ),
      ],
    );
  }
}