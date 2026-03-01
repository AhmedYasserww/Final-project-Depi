// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:smart_store/core/widgets/custom_button.dart';
// import '../utils/app_style.dart';
//
// class CustomEmptyItem extends StatelessWidget {
//   const CustomEmptyItem({super.key, required this.title, required this.subtitle, required this.imagePath, required this.buttonTitle, required this.onTap});
//   final String title;
//   final String subtitle;
//   final String imagePath;
//   final String buttonTitle;
//   final VoidCallback onTap;
//
//   double _clamp(double value, double min, double max) {
//     return value.clamp(min, max);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//
//     final textHorizontalPadding =
//     _clamp(screenWidth * 0.15, 40, 80);
//
//     final buttonHorizontalPadding =
//     _clamp(screenWidth * 0.28, 80, 140);
//
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//        //   SvgPicture.asset(AppImages.emptyCart),
// SvgPicture.asset(imagePath),
//           const SizedBox(height: 24),
//
//           Text(
//             title,
//            // "Your Cart is empty",
//             style: AppStyle.styleBold20,
//           ),
//
//           const SizedBox(height: 8),
//
//           Padding(
//             padding: EdgeInsets.symmetric(
//               horizontal: textHorizontalPadding,
//             ),
//             child: Text(
//               subtitle,
//             //  "Looks like you haven’t added anything yet."
//             //      " Start exploring products now!",
//               textAlign: TextAlign.center,
//               style: AppStyle.styleRegular16,
//             ),
//           ),
//
//           const SizedBox(height: 32),
//
//           Padding(
//             padding: EdgeInsets.symmetric(
//               horizontal: buttonHorizontalPadding,
//             ),
//             child: CustomButton(
//               text: buttonTitle,
//             //  text: "Start Shopping",
//               onTap: onTap,
//             //   onTap: () {
//             //     Navigator.of(context).pushReplacementNamed(
//             //       CustomNavigationBar.routeName,
//             //     );
//             //   },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
