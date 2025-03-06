import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_e_commerce/core/helper_functions/build_error_bar.dart';
import 'package:fruit_e_commerce/features/checkout/presentation/manger/add_order_cubit/add_order_cubit.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class AddOrderCubitBlocBuilder extends StatelessWidget {
  const AddOrderCubitBlocBuilder({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddOrderCubit, AddOrderState>(
      listener: (context, state) {
        if (state is AddOrderSuccess) {
          showBar(
            context,
            'تم العملية بنجاح',
          );
        }

        if (state is AddOrderFailure) {
          showBar(
            context,
            state.errMessage,
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
            inAsyncCall: state is AddOrderLoading, child: child);
      },
    );
  }
}
