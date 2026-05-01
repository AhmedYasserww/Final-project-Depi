import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kids_education_learning/core/utils/app_color.dart';
import 'package:kids_education_learning/core/utils/app_dimensions.dart';
import 'package:kids_education_learning/core/widgets/custom_button.dart';
import 'package:kids_education_learning/core/widgets/custom_terms_and_privacy_text.dart';
import 'package:kids_education_learning/core/widgets/custom_text_field.dart';
import 'package:kids_education_learning/core/widgets/custom_label_text.dart';
import 'package:kids_education_learning/core/widgets/custom_title_text_in_screen.dart';
import 'package:kids_education_learning/feature/parent_auth/presentation/manager/teacher_register/teacher_register_cubit.dart';
import 'package:kids_education_learning/feature/parent_auth/presentation/manager/teacher_register/teacher_register_state.dart';
import 'package:kids_education_learning/feature/parent_auth/presentation/views/add_child_name_view.dart';

import '../../../../../core/widgets/custom_parent_form.dart';
import '../../../../../core/widgets/custom_teacher_form.dart';
import '../teacher_detailes_view.dart';

class CreateAccountViewBody extends StatefulWidget {
  const CreateAccountViewBody({super.key});

  @override
  State<CreateAccountViewBody> createState() => _CreateAccountViewBodyState();
}

class _CreateAccountViewBodyState extends State<CreateAccountViewBody> {
  bool isParentSelected = true;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _fullNameController = TextEditingController(); // for teacher

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _fullNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            // Navigator.pop(context);
          },
          icon: Icon(CupertinoIcons.back),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppDimensions.authScreenPadding,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 24),
                    CustomTitleText(text: 'Create Account'),
                    SizedBox(height: 24),
                    Container(
                      height: 40,
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: AppColors.switchColor,
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
                                      ? AppColors.backGroundColor
                                      : AppColors.switchColor,
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
                                      color: Color(0xFF000846),
                                      fontWeight: isParentSelected
                                          ? FontWeight.w600
                                          : FontWeight.w400,
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
                                      ? AppColors.backGroundColor
                                      : AppColors.switchColor,
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
                                      color: Color(0xFF000846),
                                      fontWeight: !isParentSelected
                                          ? FontWeight.w400
                                          : FontWeight.w600,
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
                          controller: _emailController,
                          hintText: "youremail@gmail.com",
                          hintColor: Color(0xFF121261),
                          fillColor: Color(0xFFF1F1F1),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: isParentSelected
                          ? const ParentForm()
                          : TeacherForm(
                              fullNameController: _fullNameController,
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
                          controller: _passwordController,
                          hintText: "*********",
                          isFilled: false,
                          hintColor: Color(0xFF121261),
                          // fillColor: Colors.white,
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.visibility_off_outlined,
                              color: Color(0xffAFAFAF),
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 24),
                      child:
                          BlocConsumer<
                            TeacherRegisterCubit,
                            TeacherRegisterState
                          >(
                            listener: (context, state) {
                              if (state is TeacherRegisterSuccess) {
                                Navigator.pushNamed(
                                  context,
                                  TeacherDetailsView.routeName,
                                );
                              } else if (state is TeacherRegisterFailure) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(state.errorMessage)),
                                );
                              }
                            },
                            builder: (context, state) {
                              return CustomButton(
                                text: state is TeacherRegisterLoading
                                    ? 'Loading...'
                                    : 'Sign Up',
                                onTap: state is TeacherRegisterLoading
                                    ? () {}
                                    : () {
                                        if (isParentSelected) {
                                          Navigator.pushNamed(
                                            context,
                                            AddChildNameView.routeName,
                                          );
                                        } else {
                                          context
                                              .read<TeacherRegisterCubit>()
                                              .teacherRegister(
                                                email: _emailController.text
                                                    .trim(),
                                                password: _passwordController
                                                    .text
                                                    .trim(),
                                                fullName: _fullNameController
                                                    .text
                                                    .trim(),
                                              );
                                        }
                                      },
                                buttonColor: AppColors.buttonColor,
                              );
                            },
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
      ),
    );
  }
}
