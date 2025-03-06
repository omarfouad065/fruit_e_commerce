import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_e_commerce/constants.dart';
import 'package:fruit_e_commerce/core/widgets/build_app_bar.dart';
import 'package:fruit_e_commerce/features/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:fruit_e_commerce/features/home/presentation/view/widgets/cart_header.dart';
import 'package:fruit_e_commerce/features/home/presentation/view/widgets/cart_items_list.dart';
import 'package:fruit_e_commerce/features/home/presentation/view/widgets/custom_cart_button.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const SizedBox(
                    height: KTopPadding,
                  ),
                  buildAppBar(
                    context,
                    title: 'السلة',
                    showNotification: false,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const CartHeader(),
                  const SizedBox(
                    height: 12,
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
                child: context.read<CartCubit>().cartEntity.cartItems.isEmpty
                    ? const SizedBox()
                    : CustomDivider()),
            CartItemsList(
              cartItems: context.watch<CartCubit>().cartEntity.cartItems,
            ),
            SliverToBoxAdapter(
                child: context.read<CartCubit>().cartEntity.cartItems.isEmpty
                    ? const SizedBox()
                    : CustomDivider()),
          ],
        ),
        Positioned(
          left: 16,
          right: 16,
          bottom: MediaQuery.sizeOf(context).height * .05,
          child: CustomCartButton(),
        )
      ],
    );
  }
}
