import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kids_education_learning/core/widgets/custom_button.dart';
import 'package:kids_education_learning/feature/bottom_nav_bar/presentation/views/bottom_nav_bar_view.dart';

class LetIsGoViewBody extends StatelessWidget {
  const LetIsGoViewBody({super.key});

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
              child: CustomButton(text: "Let's go", onTap: () {
                Navigator.of(context).pushNamed(CustomNavigationBar.routeName);
              }),
            ),
          ),
        ),
      ],
    );
  }
}
