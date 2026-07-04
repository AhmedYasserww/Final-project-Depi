import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kids_education_learning/core/helper_functions/validators.dart';
import 'package:kids_education_learning/core/utils/app_color.dart';
import 'package:kids_education_learning/core/utils/app_dimensions.dart';
import 'package:kids_education_learning/core/utils/app_style.dart';
import 'package:kids_education_learning/core/widgets/custom_button.dart';
import 'package:kids_education_learning/core/widgets/custom_terms_and_privacy_text.dart';
import 'package:kids_education_learning/core/widgets/custom_text_field.dart';
import 'package:kids_education_learning/core/widgets/custom_label_text.dart';
import 'package:kids_education_learning/core/widgets/custom_title_text_in_screen.dart';
import 'package:kids_education_learning/feature/parent_auth/presentation/manager/parent_register/parent_register_cubit.dart';
import 'package:kids_education_learning/feature/parent_auth/presentation/manager/parent_register/parent_register_state.dart';
import 'package:kids_education_learning/feature/parent_auth/presentation/manager/teacher_register/teacher_register_cubit.dart';
import 'package:kids_education_learning/feature/parent_auth/presentation/manager/teacher_register/teacher_register_state.dart';
import 'package:kids_education_learning/feature/auth/presentaions/auth_parent/views/add_child_name_view.dart';
import '../../../../auth/presentaions/auth_teacher/presentations/views/teacher_detailes_view.dart';
import '../../../../auth/presentaions/views/log_in_view.dart';

class CreateAccountViewBody extends StatefulWidget {
  const CreateAccountViewBody({super.key});

  @override
  State<CreateAccountViewBody> createState() => _CreateAccountViewBodyState();
}

class _CreateAccountViewBodyState extends State<CreateAccountViewBody> {
  static const _toggleAnimationDuration = Duration(milliseconds: 350);

  bool _isParentSelected = true;
  bool _obscurePassword = true;
  bool _autoValidate = false;

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _parentNameController = TextEditingController();
  final _teacherNameController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _parentNameController.dispose();
    _teacherNameController.dispose();
    super.dispose();
  }

  void _submit() {
    setState(() => _autoValidate = true);

    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (_isParentSelected) {
      context.read<ParentRegisterCubit>().parentRegister(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
        fullName: _parentNameController.text.trim(),
      );
    } else {
      context.read<TeacherRegisterCubit>().teacherRegister(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
        fullName: _teacherNameController.text.trim(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(CupertinoIcons.back),
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
                autovalidateMode: _autoValidate
                    ? AutovalidateMode.onUserInteraction
                    : AutovalidateMode.disabled,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24),
                    CustomTitleText(text: 'Create Account'),
                    const SizedBox(height: 24),
                    _buildRoleToggle(),
                    SizedBox(height: 16),
                    LabelText(label: 'Email'),
                    SizedBox(height: 4),
                    _buildEmailField(),
                    SizedBox(height: 16),
                    _isParentSelected
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              LabelText(label: "Parent's Name"),
                              const SizedBox(height: 4),
                              CustomTextField(
                                controller: _parentNameController,
                                validator: Validators.validateName,
                                isFilled: false,
                                hintText: "Enter your name",
                              ),
                            ],
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              LabelText(label: "Teacher's Name"),
                              SizedBox(height: 4),
                              CustomTextField(
                                controller: _teacherNameController,
                                validator: Validators.validateName,
                                isFilled: false,
                                hintText: "Enter your name",
                              ),
                            ],
                          ),

                    SizedBox(height: 16),
                    LabelText(label: 'Password'),
                    SizedBox(height: 4),
                    _buildPasswordField(),
                 //   TermsAndPrivacyText(onTermsTap: () {}, onPrivacyTap: () {}),
                    const SizedBox(height: 24),
                    _buildSignUpButton(),
                    const SizedBox(height: 16),
                    _buildLoginRow(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRoleToggle() {
    return Container(
      height: 40,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.switchColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          _buildToggleOption(
            label: 'Parent',
            selected: _isParentSelected,
            onTap: () => setState(() => _isParentSelected = true),
          ),
          _buildToggleOption(
            label: 'Teacher',
            selected: !_isParentSelected,
            onTap: () => setState(() => _isParentSelected = false),
          ),
        ],
      ),
    );
  }

  Widget _buildToggleOption({
    required String label,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: _toggleAnimationDuration,
          padding: const EdgeInsets.symmetric(vertical: 6),
          decoration: BoxDecoration(
            color: selected ? AppColors.backGroundColor : AppColors.switchColor,
            borderRadius: BorderRadius.circular(8),
            boxShadow: selected
                ? const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ]
                : const [],
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                color: const Color(0xFF000846),
                fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmailField() {
    return CustomTextField(
      controller: _emailController,
      hintText: 'youremail@gmail.com',
      hintColor: const Color(0xFF121261),
      fillColor: const Color(0xFFF1F1F1),
      validator: Validators.validateEmail,
    );
  }

  Widget _buildPasswordField() {
    return CustomTextField(
      controller: _passwordController,
      isFilled: false,
      hintText: 'Enter your password',
      obscureText: _obscurePassword,
      suffixIcon: GestureDetector(
        onTap: () => setState(() => _obscurePassword = !_obscurePassword),
        child: Icon(
          _obscurePassword
              ? Icons.visibility_off_outlined
              : Icons.visibility_outlined,
        ),
      ),
      validator: Validators.validatePassword,
    );
  }

  Widget _buildSignUpButton() {
    return MultiBlocListener(
      listeners: [
        BlocListener<ParentRegisterCubit, ParentRegisterState>(
          listener: (context, state) {
            if (state is ParentRegisterSuccess) {
              Navigator.pushNamed(context, AddChildNameView.routeName);
            } else if (state is ParentRegisterFailure) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
            }
          },
        ),
        BlocListener<TeacherRegisterCubit, TeacherRegisterState>(
          listener: (context, state) {
            if (state is TeacherRegisterSuccess) {
              Navigator.pushNamed(context, TeacherDetailsView.routeName);
            } else if (state is TeacherRegisterFailure) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
            }
          },
        ),
      ],
      child: BlocBuilder<ParentRegisterCubit, ParentRegisterState>(
        builder: (context, parentState) {
          return BlocBuilder<TeacherRegisterCubit, TeacherRegisterState>(
            builder: (context, teacherState) {
              final isLoading = _isParentSelected
                  ? parentState is ParentRegisterLoading
                  : teacherState is TeacherRegisterLoading;

              return CustomButton(
                text: 'Sign Up',
                isLoading: isLoading,
                onTap: _submit,
                buttonColor: AppColors.buttonColor,
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildLoginRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Already have an account?', style: AppStyle.styleGreyRegular14),
        TextButton(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.only(left: 3),
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          onPressed: () => Navigator.pushNamed(context, LogInView.routeName),
          child: Text('Login', style: AppStyle.linkTerms),
        ),
      ],
    );
  }
}
