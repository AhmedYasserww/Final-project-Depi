// features/auth/presentation/views/widgets/login_view_body.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kids_education_learning/core/helper_functions/validators.dart';
import 'package:kids_education_learning/core/utils/app_style.dart';
import 'package:kids_education_learning/core/widgets/custom_text_field.dart';
import 'package:kids_education_learning/feature/bottom_nav_bar/presentation/views/parent_nav_bar_view.dart';
import 'package:kids_education_learning/feature/bottom_nav_bar/presentation/views/teacher_nav_bar_view.dart';
import 'package:kids_education_learning/feature/parent_auth/presentation/views/create_account_view.dart';
import 'package:kids_education_learning/feature/parent_auth/presentation/views/home_view.dart';
import 'package:kids_education_learning/feature/parent_auth/presentation/views/teacher_home_view.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_dimensions.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../manager/log_in_cubit/login_cubit.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscure = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onLogin() {
    if (_formKey.currentState!.validate()) {
      context.read<LoginCubit>().login(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          final role = state.loginEntity.role;
          if (role == 'Teacher') {
            Navigator.of(
              context,
            ).pushReplacementNamed(TeacherNavBarView.routeName);
          } else if (role == 'Parent') {
            Navigator.of(context).pushReplacementNamed(ParentNavBarView.routeName);
          } else {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Unknown role: $role')));
          }
        } else if (state is LoginFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: Colors.red.shade600,
            ),
          );
        }
      },
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppDimensions.authScreenPadding,
          ),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppImages.logo),
                  const SizedBox(height: 48),
                  CustomTextField(
                    controller: _emailController,
                    isFilled: false,
                    hintText: "Enter your email",
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: const Icon(Icons.email_outlined),
                    validator: Validators.validateEmail,
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    controller: _passwordController,
                    isFilled: false,
                    hintText: "Enter your password",
                    obscureText: _obscure,
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: GestureDetector(
                      onTap: () => setState(() => _obscure = !_obscure),
                      child: Icon(
                        _obscure
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                      ),
                    ),
                    validator: Validators.validatePassword,
                  ),
                  const SizedBox(height: 18),
                  BlocBuilder<LoginCubit, LoginState>(
                    builder: (context, state) {
                      return CustomButton(
                        text: 'Continue',
                        isLoading: state is LoginLoading,
                        onTap: _onLogin,
                        buttonColor: AppColors.buttonColor,
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Text(
                        "Don't have an account?",
                        style: AppStyle.styleGreyRegular14,
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.only(left: 3),
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CreateAccountView(),
                            ),
                          );
                        },
                        child: Text("Join", style: AppStyle.linkTerms),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
