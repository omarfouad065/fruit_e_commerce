import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_e_commerce/core/utils/app_colors.dart';
import 'package:fruit_e_commerce/core/utils/app_text_styles.dart';
import 'package:fruit_e_commerce/features/home/presentation/cubits/cart_cubit/cart_cubit.dart';

class CartHeader extends StatelessWidget {
  const CartHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: const BoxDecoration(
        color: Color(0xffebf9f1),
      ),
      child: Center(
        child: Text(
            'لديك ${context.watch<CartCubit>().cartEntity.cartItems.length} منتجات في سلة التسوق',
            style:
                TextStyles.semiBold13.copyWith(color: AppColors.primaryColor)),
      ),
    );
  }
}
