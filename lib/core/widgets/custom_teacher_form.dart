import 'package:flutter/material.dart';

import 'custom_label_text.dart';
import 'custom_text_field.dart';

class TeacherForm extends StatelessWidget {
  final TextEditingController fullNameController;
  const TeacherForm({super.key, required this.fullNameController});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LabelText(label: "Teacher's Name"),
        SizedBox(height: 4),
        SizedBox(height: 48, child: CustomTextField(controller: fullNameController,)),
      ],
    );
  }
}
