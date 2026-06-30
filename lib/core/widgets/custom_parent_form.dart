import 'package:flutter/material.dart';
import 'package:kids_education_learning/core/helper_functions/validators.dart';

import 'custom_label_text.dart';
import 'custom_text_field.dart';

class ParentForm extends StatelessWidget {
  final TextEditingController fullNameController;

  const ParentForm({
    super.key,
    required this.fullNameController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LabelText(label: "Parent's Name"),
        const SizedBox(height: 4),
        CustomTextField(
          controller: fullNameController,
          validator: Validators.validateName,
        ),
      ],
    );
  }
}