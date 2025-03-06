import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_e_commerce/core/services/get_it_service.dart';
import 'package:fruit_e_commerce/core/widgets/custom_app_bar.dart';
import 'package:fruit_e_commerce/features/auth/domain/repos/auth_repo.dart';
import 'package:fruit_e_commerce/features/auth/presentation/cubit/signin_cubit/signin_cubit.dart';
import 'package:fruit_e_commerce/features/auth/presentation/views/widgets/singin_view_body_bloc_consumer.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});
  static const routeName = 'login';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninCubit(getIt.get<AuthRepo>()),
      child: Scaffold(
        appBar: buildAppBar(context, title: 'تسجيل دخول'),
        body: const SigninViewBodyBlocConsumer(),
      ),
    );
  }
}
