import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kids_education_learning/core/widgets/custom_button.dart';

class AccountCreatedViewBody extends StatelessWidget {
  const AccountCreatedViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(color: Color(0xFFEBEBEB)),
        SizedBox.expand(
          child: SvgPicture.asset(
            "assets/images/Background.svg",
            fit: BoxFit.cover,
          ),
        ),

        Center(
          child: SvgPicture.asset(
            "assets/images/title.svg",
          ),
        ),

        SafeArea(
          child: Align(
            alignment: Alignment
                .bottomCenter, 
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 24),
              child: CustomButton(text: "Let's go", onTap: () {}),
            ),
          ),
        ),
      ],
    );
  }
}
