import 'package:flutter/cupertino.dart';
import 'custom_switch.dart';

class PreferenceTile extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  const PreferenceTile({
    super.key,
    required this.title,
    required this.value,
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
            fontWeight: FontWeight.w400,
            color: Color(0xFF000846),
          ),
        ),
        CustomSwitch(value: value, onChanged: onChanged),
      ],
    );
  }
}