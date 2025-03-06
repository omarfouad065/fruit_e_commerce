import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_e_commerce/core/helper_functions/build_error_bar.dart';
import 'package:fruit_e_commerce/features/auth/presentation/cubit/signin_cubit/signin_cubit.dart';
import 'package:fruit_e_commerce/features/auth/presentation/views/widgets/signin_view_body.dart';
import 'package:fruit_e_commerce/features/home/presentation/view/main_view.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SigninViewBodyBlocConsumer extends StatelessWidget {
  const SigninViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninCubit, SigninState>(
      listener: (context, state) {
        if (state is SigninSuccess) {
          Navigator.pushNamed(context, MainView.routeName);
        }
        if (state is SigninFailure) {
          showBar(context, state.message);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
            inAsyncCall: state is SigninLoading ? true : false,
            child: const SigninViewBody());
      },
    );
  }
}
