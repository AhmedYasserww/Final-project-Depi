import 'package:flutter/material.dart';
import '../../../../core/utils/app_style.dart';
import '../../../../core/widgets/custom_button.dart';

void calculateSize({
  required BuildContext context,
  required String heightText,
  required String weightText,
}) {
  final height = double.tryParse(heightText) ?? 0;
  final weight = double.tryParse(weightText) ?? 0;

  String size = 'M';
  if (height > 170 && weight > 75) {
    size = 'L';
  }

  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 54,
        vertical: 32,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '$size is recommended with high confidence 82%\n'
                'If you prefer a snug fit, choose a smaller size M',
            textAlign: TextAlign.center,
            style: AppStyle.styleMedium16,
          ),
          const SizedBox(height: 32),
          CustomButton(
            text: "Choose Now",
            onTap: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    ),
  );
}
