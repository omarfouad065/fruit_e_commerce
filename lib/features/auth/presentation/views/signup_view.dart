import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_e_commerce/core/services/get_it_service.dart';
import 'package:fruit_e_commerce/core/widgets/custom_app_bar.dart';
import 'package:fruit_e_commerce/features/auth/domain/repos/auth_repo.dart';
import 'package:fruit_e_commerce/features/auth/presentation/cubit/signup_cubits/signup_cubit.dart';
import 'package:fruit_e_commerce/features/auth/presentation/views/widgets/signup_view_body_bloc_consumer.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});
  static const routeName = 'signup';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(
        getIt<AuthRepo>(),
      ),
      child: Scaffold(
          appBar: buildAppBar(context, title: 'حساب جديد'),
          body: const SignupViewBodyBlocConsumer()),
    );
  }
}
