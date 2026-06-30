// features/auth/presentation/views/login_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kids_education_learning/feature/parent_auth/presentation/views/widgets/log_in_view_body.dart';
import '../../../../core/service_locator/service_locator.dart';
import '../../data/repos/auth_repo_imp.dart';
import '../manager/log_in_cubit/login_cubit.dart';

class LogInView extends StatelessWidget {
  const LogInView({super.key});
  static const String routeName = 'login_view';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(getIt.get<AuthRepoImpl>()),
      child: const Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(child: LoginViewBody()),
      ),
    );
  }
}