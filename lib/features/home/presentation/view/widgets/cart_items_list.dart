import 'package:flutter/material.dart';
import 'package:fruit_e_commerce/features/home/domain/entities/cart_item_entity.dart';
import 'package:fruit_e_commerce/features/home/presentation/view/widgets/cart_item.dart';

class CartItemsList extends StatelessWidget {
  const CartItemsList({super.key, required this.cartItems});

  final List<CartItemEntity> cartItems;

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
        separatorBuilder: (context, index) => CustomDivider(),
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
            ),
            child: CartItem(
              cartItemEntity: cartItems[index],
            ),
          );
        });
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: Color(0xfff1f1f5),
      height: 22,
    );
  }
}
