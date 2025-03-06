import 'package:flutter/material.dart';
import 'package:fruit_e_commerce/core/utils/app_images.dart';
import 'package:fruit_e_commerce/core/utils/app_text_styles.dart';
import 'package:svg_flutter/svg.dart';

class ProductsCountHeader extends StatelessWidget {
  const ProductsCountHeader({super.key, required this.productsLength});
  final int productsLength;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          textAlign: TextAlign.start,
          '${productsLength.toString()} نتائج ',
          style: TextStyles.bold16,
        ),
        Spacer(),
        SvgPicture.asset(Assets.assetsImagesFilter2),
      ],
    );
  }
}
