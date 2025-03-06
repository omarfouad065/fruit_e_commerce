import 'package:flutter/material.dart';
import 'package:fruit_e_commerce/core/utils/app_images.dart';
import 'package:fruit_e_commerce/core/utils/app_text_styles.dart';
import 'package:svg_flutter/svg.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: const Color(0x0a000000),
          blurRadius: 16,
          offset: const Offset(0, 2),
          spreadRadius: 0,
        ),
      ]),
      child: TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: SizedBox(
              width: 20,
              child: Center(
                  child: SvgPicture.asset(Assets.assetsImagesSearchIcon))),
          suffixIcon: SizedBox(
              width: 20,
              child:
                  Center(child: SvgPicture.asset(Assets.assetsImagesFilter))),
          hintText: 'ابحث عن.......',
          hintStyle:
              TextStyles.regular13.copyWith(color: const Color(0xff949D9E)),
          filled: true,
          fillColor: Colors.white,
          border: buildBorder(),
          enabledBorder: buildBorder(),
          focusedBorder: buildBorder(),
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        borderSide: BorderSide(width: 1, color: Colors.white));
  }
}
