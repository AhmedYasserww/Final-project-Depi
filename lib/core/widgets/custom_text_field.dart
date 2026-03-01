import 'package:flutter/material.dart';
import '../utils/app_color.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.onSaved,
    this.onChange,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.controller,
    this.hintText,
    this.keyboardType,
  });

  final void Function(String?)? onSaved;
  final void Function(String?)? onChange;
  final String? Function(String?)? validator;
  final IconData? prefixIcon;
  final bool obscureText;
  final TextEditingController? controller;
  final String? hintText;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      onSaved: onSaved,
      onChanged: onChange,
      validator: validator,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xffF9FAFA),

        prefixIcon: prefixIcon != null
            ? Icon(prefixIcon, size: 30)
            : null,

        prefixIconColor: WidgetStateColor.resolveWith((states) {
          if (states.contains(WidgetState.error)) {
            return Colors.red;
          }
          if (states.contains(WidgetState.focused)) {
            return AppColors.primaryColor;
          }
          return AppColors.greyTextColor; // enabled
        }),

        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Color(0xff666666)),

        enabledBorder: _buildBorder(AppColors.palletBorderColor),
        focusedBorder: _buildBorder(AppColors.primaryColor),
        errorBorder: _buildBorder(Colors.red),
        focusedErrorBorder: _buildBorder(Colors.red),
        border: _buildBorder(),
      ),
    );
  }

  OutlineInputBorder _buildBorder([Color? color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: color ?? AppColors.primaryColor,
        width: 1,
      ),
    );
  }
}
