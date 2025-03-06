import 'package:flutter/material.dart';
import 'package:fruit_e_commerce/constants.dart';
import 'package:fruit_e_commerce/core/cubits/products_cubit/products_cubit.dart';
import 'package:fruit_e_commerce/core/widgets/search_text_field.dart';
import 'package:fruit_e_commerce/features/home/presentation/view/widgets/products_grid_view_bloc_builder.dart';
import 'package:fruit_e_commerce/features/home/presentation/view/widgets/best_selling_header.dart';
import 'package:fruit_e_commerce/features/home/presentation/view/widgets/featured_list.dart';
import 'package:fruit_e_commerce/features/home/presentation/view/widgets/home_view_app_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
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
              HomeViewAppBar(),
              SizedBox(height: 16),
              SearchTextField(),
              SizedBox(height: 12),
              FeaturedList(),
              SizedBox(height: 12),
              BestSellingHeader(),
              SizedBox(height: 8),
            ],
          )),
          ProductsGridViewBlocBuilder(),
        ],
      ),
    );
  }
}
