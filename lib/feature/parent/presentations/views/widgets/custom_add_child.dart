import 'package:flutter/material.dart';

class CustomAddChild extends StatelessWidget {
  final int maxChildren;
  final VoidCallback onAddChild;

  const CustomAddChild({
    super.key,
    this.maxChildren = 2,
    required this.onAddChild,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Children',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1D2860),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'You can add up to $maxChildren\nchildren on a free plan.',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xFF6B7280),
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 13.5),
            child: OutlinedButton(
              onPressed: onAddChild,
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                side: const BorderSide(color: Color(0xFFE5E7EB), width: 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Row(
                children: [
                  Icon(Icons.add, color: Color(0xFF1D2860), size: 20),
                  SizedBox(width: 8),
                  Text(
                    'Add Child',
                    style: TextStyle(
                      color: Color(0xFF1D2860),
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
