import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_e_commerce/core/cubits/products_cubit/products_cubit.dart';
import 'package:fruit_e_commerce/core/helper_functions/get_dummy_product.dart';
import 'package:fruit_e_commerce/core/widgets/custom_error_widget.dart';
import 'package:fruit_e_commerce/features/home/presentation/view/widgets/products_grid_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductsGridViewBlocBuilder extends StatelessWidget {
  const ProductsGridViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsSuccess) {
          return ProductsGridView(
            products: state.products,
          );
        } else if (state is ProductsFailure) {
          return SliverToBoxAdapter(
            child: CustomErrorWidget(
              text: state.errMessage,
            ),
          );
        } else {
          return Skeletonizer.sliver(
              child: ProductsGridView(
            products: getDummyProducts(),
          ));
        }
      },
    );
  }
}
