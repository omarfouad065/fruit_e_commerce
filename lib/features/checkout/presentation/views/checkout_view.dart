import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_e_commerce/core/helper_functions/get_user.dart';
import 'package:fruit_e_commerce/core/repos/orders_repo/orders_repo.dart';
import 'package:fruit_e_commerce/core/services/get_it_service.dart';
import 'package:fruit_e_commerce/core/widgets/build_app_bar.dart';
import 'package:fruit_e_commerce/features/checkout/domain/entities/order_entity.dart';
import 'package:fruit_e_commerce/features/checkout/domain/entities/shipping_address_entity.dart';
import 'package:fruit_e_commerce/features/checkout/presentation/manger/add_order_cubit/add_order_cubit.dart';
import 'package:fruit_e_commerce/features/checkout/presentation/views/widgets/add_order_cubit_bloc_builder.dart';
import 'package:fruit_e_commerce/features/checkout/presentation/views/widgets/checkout_view_body.dart';
import 'package:fruit_e_commerce/features/home/domain/entities/cart_entity.dart';
import 'package:provider/provider.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key, required this.cartEntity});

  static const routeName = 'checkout';
  final CartEntity cartEntity;

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  late OrderEntity orderEntity;

  @override
  void initState() {
    super.initState();
    orderEntity = OrderEntity(widget.cartEntity,
        shippingAddressEntity: ShippingAddressEntity(), uID: getUser().uId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddOrderCubit(getIt.get<OrdersRepo>()),
      child: Scaffold(
        appBar: buildAppBar(context, title: 'الشحن', showNotification: false),
        body: Provider<OrderEntity>.value(
          value: orderEntity,
          child: AddOrderCubitBlocBuilder(child: const CheckoutViewBody()),
        ),
      ),
    );
  }
}
