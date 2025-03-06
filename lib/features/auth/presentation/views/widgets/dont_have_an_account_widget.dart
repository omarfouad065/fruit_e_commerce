import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruit_e_commerce/core/utils/app_colors.dart';
import 'package:fruit_e_commerce/core/utils/app_text_styles.dart';
import 'package:fruit_e_commerce/features/auth/presentation/views/signup_view.dart';

class DontHaveAnAccountWidget extends StatelessWidget {
  const DontHaveAnAccountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(children: [
      TextSpan(
        text: 'لا تمتلك حساب؟',
        style: TextStyles.semiBold16.copyWith(color: const Color(0xff949d9e)),
      ),
      TextSpan(
        text: ' ',
        style: TextStyles.semiBold16.copyWith(color: const Color(0xff616a6b)),
      ),
      TextSpan(
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            Navigator.of(context).pushNamed(SignupView.routeName);
          },
        text: 'قم بإنشاء حساب',
        style: TextStyles.semiBold16.copyWith(color: AppColors.primaryColor),
      ),
    ]));
  }
}
