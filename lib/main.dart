// import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kids_education_learning/feature/parent_auth/presentation/views/schedul_view.dart';
import 'package:kids_education_learning/feature/parent_auth/presentation/views/teacher_schedule_view.dart';
import 'core/helper_functions/on_generate_routes.dart';
import 'feature/bottom_nav_bar/presentation/views/bottom_nav_bar_view.dart';
import 'feature/parent_auth/presentation/views/create_account_view.dart';
import 'feature/parent_auth/presentation/views/sign_up_view.dart';
import 'feature/parent_auth/presentation/views/widgets/create_account_view_body.dart';
import 'feature/parent_auth/presentation/views/widgets/teacher_details_view_body.dart';


void main() {
  runApp(
    // DevicePreview(
    //   enabled: !kReleaseMode,
    //   builder: (context) => MyApp(),
    // ),
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //  useInheritedMediaQuery: true,
      // locale: DevicePreview.locale(context),
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Inter',
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFFFFFFF),
          elevation: 0,
        ),
      ),

      
      // home: TeacherScheduleView(),
      onGenerateRoute: onGenerateRoutes,
      initialRoute: SignUpView.routeName,
    );
  }
}