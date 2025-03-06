import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_e_commerce/core/helper_functions/build_error_bar.dart';
import 'package:fruit_e_commerce/core/widgets/custom_button.dart';
import 'package:fruit_e_commerce/features/checkout/presentation/views/checkout_view.dart';
import 'package:fruit_e_commerce/features/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:fruit_e_commerce/features/home/presentation/cubits/cart_item_cubit/cart_item_cubit.dart';

class CustomCartButton extends StatelessWidget {
  const CustomCartButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      builder: (context, state) {
        return CustomButton(
            text:
                'الدفع ${context.watch<CartCubit>().cartEntity.calculateTotalPrice()} جنيه',
            onPressed: () {
              if (context.read<CartCubit>().cartEntity.cartItems.isNotEmpty) {
                Navigator.pushNamed(context, CheckoutView.routeName,
                    arguments: context.read<CartCubit>().cartEntity);
              } else {
                showBar(context, 'السلة فارغة');
              }
            });
      },
    );
  }
}
