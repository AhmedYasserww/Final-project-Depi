import 'package:flutter/material.dart';
import 'package:kids_education_learning/feature/parent_auth/presentation/views/add_child_name_view.dart';
import 'package:kids_education_learning/feature/parent_auth/presentation/views/create_account_view.dart';
import 'package:kids_education_learning/feature/parent_auth/presentation/views/shop_view.dart';
import '../../feature/parent_auth/presentation/views/choose_activity_view.dart';
import '../../feature/parent_auth/presentation/views/choose_goal_view.dart';
import '../../feature/parent_auth/presentation/views/inbox_chat_view.dart';
import '../../feature/parent_auth/presentation/views/sign_up_view.dart';
import '../../feature/parent_auth/presentation/views/lessons_view.dart';

Route<dynamic> onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    // case SplashView.routeName:
    //   return MaterialPageRoute(builder: (context) => const SplashView());

    case SignUpView.routeName:
      return MaterialPageRoute(builder: (context) => const SignUpView());
    case AddChildNameView.routeName:
      return MaterialPageRoute(builder: (context) => const AddChildNameView());
    case CreateAccountView.routeName:
      return MaterialPageRoute(builder: (context) => const CreateAccountView());
    case ChooseActivityView.routeName:
      return MaterialPageRoute(
        builder: (context) => const ChooseActivityView(),
      );
    case ChooseGoalView.routeName:
      return MaterialPageRoute(builder: (context) => const ChooseGoalView());
    case LessonsView.routeName:
      return MaterialPageRoute(builder: (context) => const LessonsView());
        case InboxChatView.routeName:
          return MaterialPageRoute(builder: (context) => const InboxChatView());
        case ShopView.routeName:
          return MaterialPageRoute(builder: (context) => const ShopView());
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
