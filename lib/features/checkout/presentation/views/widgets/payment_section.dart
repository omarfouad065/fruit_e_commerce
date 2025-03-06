import 'package:flutter/material.dart';
import 'package:fruit_e_commerce/features/checkout/presentation/views/widgets/order_summery.dart';
import 'package:fruit_e_commerce/features/checkout/presentation/views/widgets/shipping_address_widget.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({super.key, required this.pageController});
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 24,
        ),
        OrderSummery(),
        SizedBox(
          height: 8,
        ),
        ShippingAddress(
          pageController: pageController,
        ),
      ],
    );
  }
}
