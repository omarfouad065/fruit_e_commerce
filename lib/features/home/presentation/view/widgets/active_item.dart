import 'package:flutter/material.dart';
import 'package:fruit_e_commerce/core/utils/app_colors.dart';
import 'package:fruit_e_commerce/core/utils/app_text_styles.dart';
import 'package:svg_flutter/svg.dart';

class activeItem extends StatelessWidget {
  const activeItem({super.key, required this.image, required this.title});

  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Center(
        child: Container(
          padding: const EdgeInsets.only(left: 16),
          decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              color: Color(0xffeeeeee)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    color: Color(0xff1b5e37)),
                child: Center(child: SvgPicture.asset(image)),
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                title,
                style: TextStyles.semiBold11
                    .copyWith(color: AppColors.primaryColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
