import 'package:flutter/material.dart';
import 'package:kids_education_learning/core/service_locator/service_locator.dart';
import 'package:kids_education_learning/feature/parent_auth/presentation/manager/category_cubit/category_cubit.dart';
import 'package:kids_education_learning/feature/parent_auth/presentation/views/widgets/home_view_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const String routeName = 'home_view';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        print('HOME VIEW: creating CategoryCubit and calling getCategories');
        return getIt<CategoryCubit>()..getCategories();
      },
      child: const HomeViewBody(),
    );
  }
}
