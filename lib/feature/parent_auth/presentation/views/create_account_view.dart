import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kids_education_learning/core/service_locator/service_locator.dart';
import 'package:kids_education_learning/feature/parent_auth/data/repos/auth_repo_imp.dart';
import 'package:kids_education_learning/feature/parent_auth/presentation/manager/teacher_register/teacher_register_cubit.dart';
import 'package:kids_education_learning/feature/parent_auth/presentation/views/widgets/create_account_view_body.dart';

class CreateAccountView extends StatelessWidget {
  const CreateAccountView({super.key});
  static const String routeName = 'create_Account_View';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TeacherRegisterCubit(authRepo: getIt.get<AuthRepoImpl>()),
      child: CreateAccountViewBody(),
    );
  }
}
