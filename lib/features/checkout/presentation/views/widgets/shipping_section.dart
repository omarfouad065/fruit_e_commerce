import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_e_commerce/features/checkout/domain/entities/order_entity.dart';
import 'package:fruit_e_commerce/features/checkout/presentation/views/widgets/shipping_item.dart';

class ShippingSection extends StatefulWidget {
  const ShippingSection({super.key});

  @override
  State<ShippingSection> createState() => _ShippingSectionState();
}

class _ShippingSectionState extends State<ShippingSection>
    with AutomaticKeepAliveClientMixin {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    var orderEntity = context.read<OrderEntity>();
    return Column(
      children: [
        SizedBox(
          height: 33,
        ),
        ShippingItem(
          onTap: () {
            setState(() {
              selectedIndex = 0;
            });
            orderEntity.payWithCash = true;
          },
          isSelected: selectedIndex == 0,
          title: 'الدفع عند الاستلام',
          subtitle: 'التسليم في المكان',
          price: (context.read<OrderEntity>().cartEntity.calculateTotalPrice() +
                  30)
              .toString(),
        ),
        SizedBox(
          height: 16,
        ),
        ShippingItem(
          onTap: () {
            setState(() {
              selectedIndex = 1;
            });
            orderEntity.payWithCash = false;
          },
          isSelected: selectedIndex == 1,
          title: 'الدفع اونلاين',
          subtitle: 'يرجي تحديد طريقة الدفع',
          price: context
              .read<OrderEntity>()
              .cartEntity
              .calculateTotalPrice()
              .toString(),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
