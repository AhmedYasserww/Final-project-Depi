import 'package:flutter/material.dart';

class PersonalInfoTile extends StatelessWidget {
  final String label;
  final String value;
  final VoidCallback onEditPressed;
  final bool isPassword;
  final bool showDivider;

  const PersonalInfoTile({
    super.key,
    required this.label,
    required this.value,
    required this.onEditPressed,
    this.isPassword = false,
    this.showDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1D2860),
              ),
            ),
            GestureDetector(
              onTap: onEditPressed,
              child: const Text(
                'Edit',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1D2860),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          isPassword ? '••••••••••••••' : value,
          style: TextStyle(
            fontSize: 16,
            color: const Color(0xFF6B7280),
            letterSpacing: isPassword ? 2.0 : 0.5,
          ),
        ),

        // if (showDivider) ...[
        //   const SizedBox(height: 12),
        //   const Divider(color: Color(0xFFE5E7EB), thickness: 1),
        //   const SizedBox(height: 16),
        // ],
      ],
    );
  }
}
