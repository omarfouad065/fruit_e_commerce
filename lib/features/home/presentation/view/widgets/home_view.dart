import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_e_commerce/core/cubits/products_cubit/products_cubit.dart';
import 'package:fruit_e_commerce/core/repos/products_repo/products_repo.dart';
import 'package:fruit_e_commerce/core/services/get_it_service.dart';
import 'package:fruit_e_commerce/features/home/presentation/view/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit(getIt.get<ProductsRepo>()),
      child: HomeViewBody(),
    );
  }
}
