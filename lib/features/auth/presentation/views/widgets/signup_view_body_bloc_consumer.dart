import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_e_commerce/core/helper_functions/build_error_bar.dart';
import 'package:fruit_e_commerce/features/auth/presentation/cubit/signup_cubits/signup_cubit.dart';
import 'package:fruit_e_commerce/features/auth/presentation/views/widgets/signup_view_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignupViewBodyBlocConsumer extends StatelessWidget {
  const SignupViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(listener: (context, state) {
      if (state is SignupSuccess) {
        Navigator.pop(context);
      }
      if (state is SignupFailure) {
        showBar(context, state.message);
      }
    }, builder: (context, state) {
      return ModalProgressHUD(
          inAsyncCall: state is SignupLoading ? true : false,
          child: const SignUpViewBody());
    });
  }
}
