import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kids_education_learning/core/utils/app_color.dart';
import 'package:kids_education_learning/core/widgets/custom_button.dart';
import 'package:kids_education_learning/core/widgets/custom_text_field.dart';
import 'package:kids_education_learning/core/widgets/custom_label_text.dart';
import 'package:kids_education_learning/core/widgets/custom_title_text_in_screen.dart';

class CreateAccountViewBody extends StatefulWidget {
  const CreateAccountViewBody({super.key});

  @override
  State<CreateAccountViewBody> createState() => _CreateAccountViewBodyState();
}

class _CreateAccountViewBodyState extends State<CreateAccountViewBody> {
  bool isParentSelected = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Back'),
        leading: IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.back)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              width: 361,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: CustomTitleText(text: 'Create Account'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24),
                    child: Container(
                      height: 40,
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () => setState(() => isParentSelected = true),
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 250),
                                padding: EdgeInsets.symmetric(vertical: 6),
                                decoration: BoxDecoration(
                                  color: isParentSelected ? Colors.white : Colors.transparent,
                                  borderRadius: BorderRadius.circular(7),
                                  boxShadow: isParentSelected
                                      ? [BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2))]
                                      : [],
                                ),
                                child: Center(
                                  child: Text(
                                    "Parent",
                                    style: TextStyle(
                                      color: Color(0xFF0D1B48),
                                      fontWeight: isParentSelected ? FontWeight.bold : FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () => setState(() => isParentSelected = false),
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 250),
                                padding: EdgeInsets.symmetric(vertical: 6),
                                decoration: BoxDecoration(
                                  color: !isParentSelected ? Colors.white : Colors.transparent,
                                  borderRadius: BorderRadius.circular(7),
                                  boxShadow: !isParentSelected
                                      ? [BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2))]
                                      : [],
                                ),
                                child: Center(
                                  child: Text(
                                    "Teacher",
                                    style: TextStyle(
                                      color: Color(0xFF0D1B48),
                                      fontWeight: !isParentSelected ? FontWeight.bold : FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: LabelText(label: 'Email',),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: SizedBox(
                        height: 48,
                        child: CustomTextField(hintText: "youremail@gmail.com",hintColor: Color(0xFF121261),fillColor: Color(0xFFF1F1F1),)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: LabelText(label: "Parent's Name",),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: SizedBox(
                        height: 48,
                        child: CustomTextField(fillColor: Colors.white,)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: LabelText(label: 'Password',),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: SizedBox(
                        height: 48,
                        child: CustomTextField(hintText: "*********",hintColor: Color(0xFF121261),fillColor: Colors.white,)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24),
                    child: CustomButton(
                      text: 'Sign Up',
                      onTap: () {},
                      buttonColor: AppColors.buttonColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
