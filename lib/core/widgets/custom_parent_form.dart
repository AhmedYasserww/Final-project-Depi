import 'package:flutter/material.dart';

import 'custom_label_text.dart';
import 'custom_text_field.dart';

class ParentForm extends StatelessWidget {
  const ParentForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LabelText(label: "Parent's Name"),
        SizedBox(height: 4),
        SizedBox(
          height: 48,
          child: CustomTextField(),
        ),
      ],
    );
  }
}