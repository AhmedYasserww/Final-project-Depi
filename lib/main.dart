import 'package:flutter/material.dart';
import 'package:kids_education_learning/feature/splash/presentations/views/splash_view.dart';
import 'core/helper_functions/on_generate_routes.dart';
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

      onGenerateRoute: onGenerateRoutes,
      initialRoute: SplashScreen.routeName,
      // onGenerateRoute: onGenerateRoutes,
      // initialRoute: CreateAccountView.routeName,
    );
  }
}
