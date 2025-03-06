import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_e_commerce/core/entities/product_entity.dart';
import 'package:fruit_e_commerce/core/utils/app_colors.dart';
import 'package:fruit_e_commerce/core/utils/app_text_styles.dart';
import 'package:fruit_e_commerce/features/home/presentation/cubits/cart_cubit/cart_cubit.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key, required this.productEntity});

  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          color: Color(0xfff3f5f7)),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite_outline,
                color: Color(0xffb0b0b0),
              ),
            ),
          ),
          Positioned.fill(
              child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Flexible(child: Image.network(productEntity.imageUrl!)),
              SizedBox(
                height: 24,
              ),
              ListTile(
                title: Text(
                  productEntity.name,
                  style: TextStyles.semiBold16,
                ),
                subtitle: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '${productEntity.price} جنيه',
                        style: TextStyles.bold13.copyWith(
                          color: AppColors.secondaryColor,
                        ),
                      ),
                      TextSpan(
                        text: '/',
                        style: TextStyles.bold13.copyWith(
                          color: AppColors.lightSecondaryColor,
                        ),
                      ),
                      TextSpan(
                        text: ' ',
                        style: TextStyles.semiBold13.copyWith(
                          color: AppColors.secondaryColor,
                        ),
                      ),
                      TextSpan(
                        text: 'كيلو',
                        style: TextStyles.semiBold13.copyWith(
                          color: AppColors.lightSecondaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
                trailing: GestureDetector(
                  onTap: () {
                    context.read<CartCubit>().addProduct(productEntity);
                  },
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      color: AppColors.primaryColor,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
            ],
          )),
        ],
      ),
    );
  }
}
