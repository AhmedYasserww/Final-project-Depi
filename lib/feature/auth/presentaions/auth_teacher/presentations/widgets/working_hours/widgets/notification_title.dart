import 'package:flutter/material.dart';

class NotificationTile extends StatelessWidget {
  final String title;
  final bool isChecked;
  final ValueChanged<bool> onChanged;

  const NotificationTile({
    super.key,
    required this.title,
    required this.isChecked,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            color: Color(0xFF000846),
          ),
        ),
        GestureDetector(
          onTap: () => onChanged(!isChecked),
          child: Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: isChecked ? const Color(0xFF343B6E) : Color(0xFFFFFFFF),
              borderRadius: BorderRadius.circular(10),
              border: isChecked
                  ? null
                  : Border.all(color: const Color(0xFFDFDFDF), width: 2),
            ),
            child: isChecked
                ? const Icon(Icons.check, color: Color(0xFFFFFFFF), size: 20)
                : null,
          ),
        ),
      ],
    );
  }
}