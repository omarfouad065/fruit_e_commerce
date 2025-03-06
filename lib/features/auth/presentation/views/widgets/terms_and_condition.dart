import 'package:flutter/material.dart';

import 'package:fruit_e_commerce/core/utils/app_colors.dart';
import 'package:fruit_e_commerce/core/utils/app_text_styles.dart';
import 'package:fruit_e_commerce/features/auth/presentation/views/widgets/custom_check_box.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({super.key, required this.onChanged});

  final ValueChanged<bool> onChanged;

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  bool isTermsAccepted = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckBox(
          onChecked: (value) {
            isTermsAccepted = value;
            widget.onChanged(value);
            setState(() {});
          },
          isChecked: isTermsAccepted,
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: Text.rich(TextSpan(children: [
            TextSpan(
              text: 'من خلال إنشاء حساب ، فإنك توافق على',
              style: TextStyles.semiBold13
                  .copyWith(color: const Color(0xff949d9e)),
            ),
            TextSpan(
              text: ' ',
              style: TextStyles.semiBold13
                  .copyWith(color: const Color(0xff616a6b)),
            ),
            TextSpan(
              text: 'لشروط والأحكام الخاصة بنا',
              style: TextStyles.semiBold13
                  .copyWith(color: AppColors.lightPrimaryColor),
            ),
          ])),
        )
      ],
    );
  }
}
