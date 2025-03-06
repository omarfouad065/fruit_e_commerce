import 'package:flutter/material.dart';
import 'package:fruit_e_commerce/features/checkout/presentation/views/widgets/active_step_item.dart';
import 'package:fruit_e_commerce/features/checkout/presentation/views/widgets/inactive_step_item.dart';

class StepItem extends StatelessWidget {
  const StepItem(
      {super.key,
      required this.index,
      required this.text,
      required this.isActive});
  final String index, text;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      duration: const Duration(milliseconds: 300),
      crossFadeState:
          isActive ? CrossFadeState.showSecond : CrossFadeState.showFirst,
      firstChild: InActiveStepItem(text: text, index: index),
      secondChild: ActiveStepItem(
        text: text,
      ),
    );
  }
}
