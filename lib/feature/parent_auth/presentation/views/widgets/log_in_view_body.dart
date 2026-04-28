// features/auth/presentation/views/widgets/login_view_body.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kids_education_learning/feature/bottom_nav_bar/presentation/views/bottom_nav_bar_view.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_dimensions.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../manager/log_in_cubit/login_cubit.dart';
import 'email_field.dart';
import 'log_in_social_buttons.dart';
import 'password_field.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

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
         Navigator.of(context).pushReplacementNamed(CustomNavigationBar.routeName);
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
                  EmailField(controller: _emailController),
                  const SizedBox(height: 16),
                  PasswordField(controller: _passwordController),
                  const SizedBox(height: 18),
                  BlocBuilder<LoginCubit, LoginState>(
                    builder: (context, state) {
                      return CustomButton(
                        text: state is LoginLoading ? 'Loading...' : 'Continue',
                        onTap: state is LoginLoading ? () {} : _onLogin,
                        buttonColor: AppColors.buttonColor,
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  const LoginSocialButtons(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}