import 'package:flutter/material.dart';
import 'package:kids_education_learning/feature/parent_auth/presentation/views/teacher_profile_view.dart';
import 'package:kids_education_learning/feature/parent_auth/presentation/views/widgets/profile_view_body.dart';
import 'package:kids_education_learning/feature/parent_auth/presentation/views/widgets/splash_screen.dart';
import 'core/service_locator/service_locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
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

      // onGenerateRoute: onGenerateRoutes,
      // initialRoute: LogInView.routeName,
      home: TeacherProfileView(),
      // onGenerateRoute: onGenerateRoutes,
      // initialRoute: CreateAccountView.routeName,
    );
  }
}
