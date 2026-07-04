import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import 'package:kids_education_learning/core/utils/app_color.dart';
import 'package:kids_education_learning/core/utils/app_style.dart';

class CustomCountryTextField extends StatefulWidget {
  final TextEditingController? controller;

  const CustomCountryTextField({super.key, this.controller});

  @override
  State<CustomCountryTextField> createState() => _CustomCountryTextFieldState();
}

class _CustomCountryTextFieldState extends State<CustomCountryTextField> {
  Country? _selectedCountry;

  String get _displayName => _selectedCountry?.name ?? '';
  String get _flagEmoji   => _selectedCountry?.flagEmoji ?? '🌍';

  void _openCountryPicker() {
    showCountryPicker(
      context: context,
      showPhoneCode: false,
      onSelect: (Country country) {
        setState(() => _selectedCountry = country);
        // Push the country name into the controller so the cubit can read it
        widget.controller?.text = country.name;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _openCountryPicker,
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: AppColors.backGroundColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.cardBorderColor, width: 1),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            // ── Flag + Country Name ──────────────────────────
            Expanded(
              child: Text(
                _selectedCountry == null
                    ? 'Select your country'
                    : '$_flagEmoji  $_displayName',
                style: _selectedCountry == null
                    ? AppStyle.countryStyleTextForm   // hint style (grey)
                    : AppStyle.countryStyleTextForm.copyWith(
                        color: Colors.black87,
                      ),
                overflow: TextOverflow.ellipsis,
              ),
            ),

            // ── Arrow Icon ───────────────────────────────────
            Icon(
              Icons.keyboard_arrow_down_rounded,
              size: 20,
              color: AppColors.iconArrowDown,
            ),
          ],
        ),
      ),
    );
  }
}