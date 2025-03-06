import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruit_e_commerce/core/utils/app_colors.dart';
import 'package:fruit_e_commerce/core/utils/app_text_styles.dart';

class HaveAnAccountWidget extends StatelessWidget {
  const HaveAnAccountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(children: [
      TextSpan(
        text: 'تمتلك حساب بالفعل؟',
        style: TextStyles.semiBold16.copyWith(color: const Color(0xff949d9e)),
      ),
      TextSpan(
        text: ' ',
        style: TextStyles.semiBold16.copyWith(color: const Color(0xff616a6b)),
      ),
      TextSpan(
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            Navigator.pop(context);
          },
        text: 'تسجيل الدخول',
        style: TextStyles.semiBold16.copyWith(color: AppColors.primaryColor),
      ),
    ]));
  }
}
