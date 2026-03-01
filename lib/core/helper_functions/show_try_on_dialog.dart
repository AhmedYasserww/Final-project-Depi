// import 'package:flutter/material.dart';
// import 'package:smart_store/features/vto/presentation/views/vto_view.dart';
//
// import '../utils/app_style.dart';
// import '../widgets/custom_button.dart';
//
// void showTryOnDialog(BuildContext context) {
//   showDialog(
//     context: context,
//     builder: (_) => AlertDialog(
//       backgroundColor: Colors.white,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(24),
//       ),
//       contentPadding: const EdgeInsets.symmetric(
//         horizontal: 54,
//         vertical: 32,
//       ),
//       content: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Text(
//             'See the magic — Try it on!',
//             textAlign: TextAlign.center,
//             style: AppStyle.styleMedium16,
//           ),
//           const SizedBox(height: 32),
//           CustomButton(
//             text: 'Try on',
//             onTap: () {
//               Navigator.pop(context); // close dialog
//               Navigator.of(context).pushNamed(VtoView.routeName);
//             },
//           ),
//         ],
//       ),
//     ),
//   );
// }
