import 'package:flutter/material.dart';
import 'package:fruit_e_commerce/core/utils/app_colors.dart';
import 'package:fruit_e_commerce/core/utils/app_text_styles.dart';

class ShippingItem extends StatelessWidget {
  const ShippingItem(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.price,
      required this.isSelected,
      required this.onTap});

  final String title, subtitle, price;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.only(
          left: 13,
          right: 28,
          top: 16,
          bottom: 16,
        ),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: const Color(0x33d9d9d9),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(
                color: isSelected
                    ? AppColors.lightPrimaryColor
                    : Colors.transparent,
                width: 2,
              )),
        ),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              isSelected ? ActiveShippingItemDot() : InActiveShippingItemDot(),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyles.semiBold13,
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    subtitle,
                    textAlign: TextAlign.right,
                    style: TextStyles.regular13
                        .copyWith(color: Colors.black.withOpacity(0.5)),
                  ),
                ],
              ),
              Spacer(),
              Center(
                child: Text('$price جنيه',
                    style: TextStyles.bold13
                        .copyWith(color: AppColors.lightPrimaryColor)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InActiveShippingItemDot extends StatelessWidget {
  const InActiveShippingItemDot({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18,
      height: 18,
      decoration: ShapeDecoration(
          shape: OvalBorder(
        side: BorderSide(
          color: const Color(0xff949d9e),
          width: 1,
        ),
      )),
    );
  }
}

class ActiveShippingItemDot extends StatelessWidget {
  const ActiveShippingItemDot({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18,
      height: 18,
      decoration: ShapeDecoration(
          color: Color(0xff1b5e37),
          shape: OvalBorder(
            side: BorderSide(
              color: Colors.white,
              width: 4,
            ),
          )),
    );
  }
}
