import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_e_commerce/core/utils/app_colors.dart';
import 'package:fruit_e_commerce/core/utils/app_images.dart';
import 'package:fruit_e_commerce/core/utils/app_text_styles.dart';
import 'package:fruit_e_commerce/features/home/domain/entities/cart_item_entity.dart';
import 'package:fruit_e_commerce/features/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:fruit_e_commerce/features/home/presentation/cubits/cart_item_cubit/cart_item_cubit.dart';
import 'package:fruit_e_commerce/features/home/presentation/view/widgets/cart_item_action_buttons.dart';
import 'package:svg_flutter/svg.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.cartItemEntity,
  });

  final CartItemEntity cartItemEntity;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      buildWhen: (previous, current) {
        if (current is CartItemUpdated) {
          if (current.cartItemEntity == cartItemEntity) {
            return true;
          }
        }
        return false;
      },
      builder: (context, state) {
        return IntrinsicHeight(
          child: Row(
            children: [
              Container(
                  width: 73,
                  height: 92,
                  decoration: const BoxDecoration(color: Color(0xFFF3F5F7)),
                  child: Image.network(cartItemEntity.productEntity.imageUrl!)),
              const SizedBox(
                width: 17,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          cartItemEntity.productEntity.name,
                          style: TextStyles.bold13,
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            context
                                .read<CartCubit>()
                                .deleteCartItem(cartItemEntity);
                          },
                          child: SvgPicture.asset(
                            Assets.assetsImagesTrash,
                          ),
                        )
                      ],
                    ),
                    Text(
                      '${cartItemEntity.calculateTotalWeights()} كجم',
                      textAlign: TextAlign.right,
                      style: TextStyles.regular13.copyWith(
                        color: AppColors.secondaryColor,
                      ),
                    ),
                    Row(
                      children: [
                        CartItemActionButtons(
                          cartItemEntity: cartItemEntity,
                        ),
                        const Spacer(),
                        Text(
                          '${cartItemEntity.calculateTotalPrice()} جنيه ',
                          style: TextStyles.bold16
                              .copyWith(color: AppColors.secondaryColor),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
