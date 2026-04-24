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
    this.labelText,
    this.keyboardType,
    this.hintColor,
    this.fillColor,
    this.borderColor,
    this.isFilled = true,
    this.maxlines,
    this.minlines,
  });

  final void Function(String?)? onSaved;
  final void Function(String?)? onChange;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final bool obscureText;
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final Color? hintColor;
  final Color? fillColor;
  final Color? borderColor;
  final bool? isFilled;
  final int? maxlines;
  final int? minlines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: maxlines != 1 ? TextInputType.multiline : keyboardType,
      obscureText: obscureText,
      onSaved: onSaved,
      onChanged: onChange,
      validator: validator,
      maxLines: maxlines ?? 1,
      minLines: minlines ?? 1,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        labelText: labelText,
        filled: isFilled,
        fillColor: fillColor ?? Color(0xFFF6F6F6),
        prefixIcon: prefixIcon,
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
        hintStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: hintColor ?? Color(0xFF707070),
        ),

        enabledBorder: _buildBorder(AppColors.textFieldBorderColor),
        focusedBorder: _buildBorder(AppColors.primaryColor),
        errorBorder: _buildBorder(Colors.red),
        focusedErrorBorder: _buildBorder(Colors.red),
        border: _buildBorder(),
      ),
    );
  }

  OutlineInputBorder _buildBorder([Color? color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: color ?? AppColors.borderColor, width: 1),
    );
  }
}
