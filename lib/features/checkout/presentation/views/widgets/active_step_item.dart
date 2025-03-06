import 'package:flutter/material.dart';
import 'package:fruit_e_commerce/core/utils/app_colors.dart';
import 'package:fruit_e_commerce/core/utils/app_text_styles.dart';

class ActiveStepItem extends StatelessWidget {
  const ActiveStepItem({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 11.5,
          backgroundColor: AppColors.primaryColor,
          child: const Icon(
            Icons.check,
            color: Colors.white,
            size: 18,
          ),
        ),
        const SizedBox(width: 4),
        Text(text,
            style: TextStyles.bold13.copyWith(color: AppColors.primaryColor)),
      ],
    );
  }
}
