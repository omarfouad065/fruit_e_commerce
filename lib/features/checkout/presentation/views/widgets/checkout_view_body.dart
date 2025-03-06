import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:fruit_e_commerce/core/helper_functions/build_error_bar.dart';
import 'package:fruit_e_commerce/core/utils/app_keys.dart';
import 'package:fruit_e_commerce/core/widgets/custom_button.dart';
import 'package:fruit_e_commerce/features/checkout/domain/entities/order_entity.dart';
import 'package:fruit_e_commerce/features/checkout/domain/entities/paypal_payment_entity/paypal_payment_entity.dart';
import 'package:fruit_e_commerce/features/checkout/presentation/manger/add_order_cubit/add_order_cubit.dart';
import 'package:fruit_e_commerce/features/checkout/presentation/views/widgets/checkout_steps.dart';
import 'package:fruit_e_commerce/features/checkout/presentation/views/widgets/checkout_steps_page_view.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key});

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  late PageController pageController;
  ValueNotifier<AutovalidateMode> valueNotifier =
      ValueNotifier(AutovalidateMode.disabled);

  int currentPageIndex = 0;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    pageController.addListener(() {
      if (pageController.page != null) {
        setState(() {
          currentPageIndex = pageController.page!.toInt();
        });
      }
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    valueNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 20),
          CheckoutSteps(
            onTap: (index) {
              if (currentPageIndex == 0) {
                pageController.animateToPage(index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn);
              } else if (index == 1) {
                var orderEntity = context.read<OrderEntity>();
                if (orderEntity.payWithCash != null) {
                  pageController.animateToPage(index,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn);
                } else {
                  showBar(context, 'يرجي تحديد طريقه الدفع');
                }
              } else {
                _handleAddressValidation();
              }
            },
            pageController: pageController,
            currentPageIndex: currentPageIndex,
          ),
          Expanded(
            child: CheckoutStepsPageView(
              pageController: pageController,
              formKey: _formKey,
              valueListenable: valueNotifier,
            ),
          ),
          CustomButton(
            text: getNextButtonText(currentPageIndex),
            onPressed: () {
              if (currentPageIndex == 0) {
                _handleShippingSectionValidation(context);
              } else if (currentPageIndex == 1) {
                _handleAddressValidation();
              } else {
                _processPayment(context);
              }
            },
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  void _handleShippingSectionValidation(BuildContext context) {
    if (context.read<OrderEntity>().payWithCash != null) {
      pageController.animateToPage(
        currentPageIndex + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn,
      );
    } else {
      showBar(context, 'يرجي اختيار طريقة الدفع');
    }
  }

  void _handleAddressValidation() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      pageController.animateToPage(
        currentPageIndex + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn,
      );
    } else {
      valueNotifier.value = AutovalidateMode.always;
    }
  }

  String getNextButtonText(int currentPageIndex) {
    switch (currentPageIndex) {
      case 2:
        return 'الدفع عبر PayPal';
      default:
        return 'التالي';
    }
  }

  void _processPayment(BuildContext context) {
    var orderEntity = context.read<OrderEntity>();
    PaypalPaymentEntity paypalPaymentEntity =
        PaypalPaymentEntity.fromEntity(orderEntity);

    var addOrderCubit = context.read<AddOrderCubit>();
    log(paypalPaymentEntity.toJson().toString());
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        clientId: kPaypalClientId,
        secretKey: kPaypalSecretKey,
        transactions: [paypalPaymentEntity.toJson()],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          Navigator.pop(context);
          addOrderCubit.addOrder(order: orderEntity);
        },
        onError: (error) {
          Navigator.pop(context);
          log(error.toString());
          showBar(context, 'حدث خطأ اثناء عملية الدفع');
        },
        onCancel: () {
          print('cancelled:');
        },
      ),
    ));
  }
}
