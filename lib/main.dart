import 'package:flutter/material.dart';
import 'core/helper_functions/on_generate_routes.dart';
import 'feature/parent_auth/presentation/views/sign_up_view.dart';
import 'feature/parent_auth/presentation/views/widgets/create_account_view_body.dart';
import 'feature/parent_auth/presentation/views/widgets/sign_up_view_body.dart';

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
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFFFFFFF),
          elevation: 0,
        ),
      ),
      onGenerateRoute: onGenerateRoutes,
      initialRoute: SignUpView.routeName,
    );
  }
}