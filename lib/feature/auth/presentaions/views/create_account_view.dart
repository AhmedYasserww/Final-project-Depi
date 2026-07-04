import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kids_education_learning/core/service_locator/service_locator.dart';
import 'package:kids_education_learning/feature/auth/presentaions/views/widgets/create_account_view_body.dart';
import '../../data/repos/auth_repo_imp.dart';
import '../auth_parent/presentaitions/manager/parent_register/parent_register_cubit.dart';
import '../auth_teacher/presentations/manager/teacher_register/teacher_register_cubit.dart';

class CreateAccountView extends StatelessWidget {
  const CreateAccountView({super.key});
  static const String routeName = 'create_Account_View';
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              TeacherRegisterCubit(authRepo: getIt.get<AuthRepoImpl>()),
        ),
        BlocProvider(
          create: (_) =>
              ParentRegisterCubit(authRepo: getIt.get<AuthRepoImpl>()),
        ),
      ],
      child: CreateAccountViewBody(),
    );
  }
}
