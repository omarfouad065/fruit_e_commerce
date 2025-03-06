import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_e_commerce/core/utils/app_text_styles.dart';
import 'package:fruit_e_commerce/features/checkout/domain/entities/order_entity.dart';
import 'package:fruit_e_commerce/features/checkout/presentation/views/widgets/payment_item.dart';

class ShippingAddress extends StatelessWidget {
  const ShippingAddress({
    super.key,
    required this.pageController,
  });
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return PaymentItem(
      title: 'عنوان التوصيل',
      child: Container(
        child: Row(
          children: [
            const Icon(Icons.location_on_outlined,
                size: 30, color: Colors.grey),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  Text(
                    '${context.read<OrderEntity>().shippingAddressEntity}',
                    style: TextStyles.regular13
                        .copyWith(color: Colors.grey.shade800),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                pageController.animateToPage(1,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.fastOutSlowIn);
              },
              child: Row(
                children: [
                  Icon(
                    Icons.edit,
                    size: 18,
                    color: Colors.grey,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'تعديل',
                    style: TextStyles.regular13.copyWith(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
