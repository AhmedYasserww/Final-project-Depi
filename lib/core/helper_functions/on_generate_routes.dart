import 'package:flutter/material.dart';

import '../../feature/parent_auth/presentation/views/parent_log_in_view.dart';


Route<dynamic> onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    // case SplashView.routeName:
    //   return MaterialPageRoute(builder: (context) => const SplashView());

     case ParentLogInView.routeName:
       return MaterialPageRoute(builder: (context) => const ParentLogInView());
    // case LogInView.routeName:
    //   return MaterialPageRoute(builder: (context) => const LogInView());
//     case RegisterView.routeName:
//       return MaterialPageRoute(builder: (context) => const RegisterView());
//     case ForgetPasswordView.routeName:
//       return MaterialPageRoute(builder: (context) => const ForgetPasswordView());
//     case VerificationView.routeName:
//       return MaterialPageRoute(builder: (context) => const VerificationView());
//     case CustomNavigationBar.routeName:
//       return MaterialPageRoute(builder: (context) => const CustomNavigationBar());
//     case HomeView.routeName:
//       return MaterialPageRoute(builder: (context) => const HomeView());
//     case SearchView.routeName:
//       return MaterialPageRoute(builder: (context) => const SearchView());
//     case ProductDetailsView.routeName:
//       return MaterialPageRoute(builder: (context) => const ProductDetailsView());
//     case FindSizeView.routeName:
//       return MaterialPageRoute(builder: (context) => const FindSizeView());
//     case ProductView.routeName:
//       return MaterialPageRoute(builder: (context) => const ProductView());
//     case VtoView.routeName:
//       return MaterialPageRoute(builder: (context) => const VtoView());
//     case CartView.routeName:
//       return MaterialPageRoute(builder: (context) => const CartView());
//     case DeliveryAddressView.routeName:
//       return MaterialPageRoute(builder: (context) => const DeliveryAddressView());
//     case DeliveryOptionView.routeName:
//       return MaterialPageRoute(builder: (context) => const DeliveryOptionView());
//     case PaymentMethodView.routeName:
//       return MaterialPageRoute(builder: (context) => const PaymentMethodView());


    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
