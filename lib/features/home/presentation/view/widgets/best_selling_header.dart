import 'package:flutter/material.dart';
import 'package:fruit_e_commerce/core/utils/app_text_styles.dart';

class BestSellingHeader extends StatelessWidget {
  const BestSellingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          textAlign: TextAlign.start,
          'الاكثر مبيعا',
          style: TextStyles.bold16,
        ),
        Spacer(),
        GestureDetector(
          onTap: () {
            print('taped');
          },
          child: Text(
            textAlign: TextAlign.end,
            'المزيد',
            style: TextStyles.bold16.copyWith(color: Color(0xff949d9e)),
          ),
        ),
      ],
    );
  }
}
