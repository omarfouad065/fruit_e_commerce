import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_e_commerce/core/helper_functions/build_error_bar.dart';
import 'package:fruit_e_commerce/features/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:fruit_e_commerce/features/home/presentation/view/widgets/main_view_body.dart';

class MainViewBodyBlocConsumer extends StatelessWidget {
  const MainViewBodyBlocConsumer({
    super.key,
    required this.currentViewIndex,
  });

  final int currentViewIndex;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
        listener: (context, state) {
          if (state is CartItemAdded) {
            showBar(context, 'تم اضافة المنتج بنجاح');
          }
          if (state is CartItemRemoved) {
            showBar(context, 'تم حذف المنتج بنجاح');
          }
        },
        child: MainViewBody(currentViewIndex: currentViewIndex));
  }
}
