import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_e_commerce/core/helper_functions/build_error_bar.dart';
import 'package:fruit_e_commerce/features/checkout/domain/entities/order_entity.dart';
import 'package:fruit_e_commerce/features/checkout/presentation/views/widgets/step_item.dart';

class CheckoutSteps extends StatelessWidget {
  const CheckoutSteps(
      {super.key,
      required this.currentPageIndex,
      required this.pageController});
  final int currentPageIndex;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(getSteps().length, (index) {
        return Expanded(
            child: GestureDetector(
          onTap: () {
            if (context.read<OrderEntity>().payWithCash != null) {
              pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.fastOutSlowIn);
            } else {
              showBar(context, 'يرجي اختيار طريقة الدفع');
            }
          },
          child: StepItem(
            isActive: index <= currentPageIndex,
            index: (index + 1).toString(),
            text: getSteps()[index],
          ),
        ));
      }),
    );
  }
}

List<String> getSteps() {
  return ['الشحن', 'العنوان', 'الدفع'];
}
