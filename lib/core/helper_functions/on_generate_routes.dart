import 'package:flutter/material.dart';
import 'package:kids_education_learning/feature/parent_auth/presentation/views/add_child_name_view.dart';
import 'package:kids_education_learning/feature/parent_auth/presentation/views/create_account_view.dart';

import '../../feature/parent_auth/presentation/views/parent_log_in_view.dart';
import '../../feature/parent_auth/presentation/views/sign_up_view.dart';

Route<dynamic> onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    // case SplashView.routeName:
    //   return MaterialPageRoute(builder: (context) => const SplashView());

    case ParentLogInView.routeName:
      return MaterialPageRoute(builder: (context) => const ParentLogInView());
    case SignUpView.routeName:
      return MaterialPageRoute(builder: (context) => const SignUpView());
    case AddChildNameView.routeName:
      return MaterialPageRoute(builder: (context) => const AddChildNameView());
    case CreateAccountView.routeName:
      return MaterialPageRoute(
        builder: (context) => const CreateAccountView(),
      );
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
