import 'package:flutter/material.dart';
import 'package:kids_education_learning/feature/parent_auth/presentation/views/parent_log_in_view.dart';

import 'core/helper_functions/on_generate_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Inter',

      ),
      onGenerateRoute: onGenerateRoutes,
      initialRoute: ParentLogInView.routeName,

    );
  }
}