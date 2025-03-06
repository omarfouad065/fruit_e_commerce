import 'package:flutter/material.dart';
import 'package:fruit_e_commerce/features/home/presentation/view/widgets/featured_item.dart';

class FeaturedList extends StatelessWidget {
  const FeaturedList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(5, (index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: FeaturedItem(),
          );
        }),
      ),
    );
  }
}
