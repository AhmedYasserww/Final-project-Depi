import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:kids_education_learning/core/utils/app_color.dart';
import 'package:kids_education_learning/core/utils/app_dimensions.dart';
import 'package:kids_education_learning/core/widgets/custom_button.dart';
import 'package:kids_education_learning/core/widgets/custom_terms_and_privacy_text.dart';
import 'package:kids_education_learning/core/widgets/custom_text_field.dart';
import 'package:kids_education_learning/core/widgets/custom_label_text.dart';
import 'package:kids_education_learning/core/widgets/custom_title_text_in_screen.dart';
import 'package:kids_education_learning/feature/parent_auth/presentation/views/add_child_name_view.dart';

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
        leading: IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.back)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: AppDimensions.authScreenPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 24,),
                  CustomTitleText(text: 'Create Account'),
                   SizedBox(height: 24,),
                    Container(
                      height: 40,
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Color(0xffEEEEEF),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () =>
                                  setState(() => isParentSelected = true),
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 350),
                                padding: EdgeInsets.symmetric(vertical: 6),
                                decoration: BoxDecoration(
                                  color: isParentSelected
                                      ? Colors.white
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: isParentSelected
                                      ? [
                                          BoxShadow(
                                            color: Colors.black12,
                                            blurRadius: 4,
                                            offset: Offset(0, 2),
                                          ),
                                        ]
                                      : [],
                                ),
                                child: Center(
                                  child: Text(
                                    "Parent",
                                    style: TextStyle(
                                      color: Color(0xFF0D1B48),
                                      fontWeight: isParentSelected
                                          ? FontWeight.bold
                                          : FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () =>
                                  setState(() => isParentSelected = false),
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 350),
                                padding: EdgeInsets.symmetric(vertical: 6),
                                decoration: BoxDecoration(
                                  color: !isParentSelected
                                      ? Colors.white
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: !isParentSelected
                                      ? [
                                          BoxShadow(
                                            color: Colors.black12,
                                            blurRadius: 4,
                                            offset: Offset(0, 2),
                                          ),
                                        ]
                                      : [],
                                ),
                                child: Center(
                                  child: Text(
                                    "Teacher",
                                    style: TextStyle(
                                      color: Color(0xFF0D1B48),
                                      fontWeight: !isParentSelected
                                          ? FontWeight.bold
                                          : FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: LabelText(label: 'Email'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: SizedBox(
                      height: 48,
                      child: CustomTextField(
                        hintText: "youremail@gmail.com",
                        hintColor: Color(0xFF121261),
                        fillColor: Color(0xFFF1F1F1),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: LabelText(label: "Parent's Name"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: SizedBox(
                      height: 48,
                      child: CustomTextField(fillColor: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: LabelText(label: 'Password'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: SizedBox(
                      height: 48,
                      child: CustomTextField(
                        hintText: "*********",
                        isFilled: false,
                        hintColor: Color(0xFF121261),
                       // fillColor: Colors.white,
suffixIcon: Icon(Icons.visibility_off,color: Color(0xffAFAFAF),size: 20,),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24),
                    child: CustomButton(
                      text: 'Sign Up',
                      onTap: () {
                        Navigator.of(context).pushNamed(AddChildNameView.routeName);
                      },
                      buttonColor: AppColors.buttonColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: TermsAndPrivacyText(
                      onTermsTap: () {},
                      onPrivacyTap: () {},
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
