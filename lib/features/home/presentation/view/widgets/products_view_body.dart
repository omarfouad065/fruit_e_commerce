import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_e_commerce/constants.dart';
import 'package:fruit_e_commerce/core/cubits/products_cubit/products_cubit.dart';
import 'package:fruit_e_commerce/core/widgets/build_app_bar.dart';

import 'package:fruit_e_commerce/core/widgets/search_text_field.dart';
import 'package:fruit_e_commerce/features/home/presentation/view/widgets/products_grid_view_bloc_builder.dart';
import 'package:fruit_e_commerce/features/home/presentation/view/widgets/products_count_header.dart';

class ProductsViewBody extends StatefulWidget {
  const ProductsViewBody({super.key});

  @override
  State<ProductsViewBody> createState() => _ProductsViewBodyState();
}

class _ProductsViewBodyState extends State<ProductsViewBody> {
  @override
  void initState() {
    context.read<ProductsCubit>().getBestSellingProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
              child: Column(
            children: [
              SizedBox(height: KTopPadding),
              buildAppBar(context, title: 'المنتجات', showBackButton: false),
              SizedBox(height: 16),
              SearchTextField(),
              SizedBox(height: 12),
              ProductsCountHeader(
                productsLength: context.read<ProductsCubit>().productsLength,
              ),
              SizedBox(height: 8),
            ],
          )),
          ProductsGridViewBlocBuilder(),
        ],
      ),
    );
  }
}
