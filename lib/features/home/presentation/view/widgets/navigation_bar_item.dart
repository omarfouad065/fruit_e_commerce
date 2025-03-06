import 'package:flutter/material.dart';
import 'package:fruit_e_commerce/features/home/domain/entities/bottom_navigation_bar_entity.dart';
import 'package:fruit_e_commerce/features/home/presentation/view/widgets/active_item.dart';
import 'package:fruit_e_commerce/features/home/presentation/view/widgets/inActive_item.dart';

class NaivgationBarItem extends StatelessWidget {
  const NaivgationBarItem(
      {super.key,
      required this.isSelected,
      required this.bottomNavigationBarEntity});

  final bool isSelected;
  final BottomNavigationBarEntity bottomNavigationBarEntity;
  @override
  Widget build(BuildContext context) {
    return isSelected
        ? activeItem(
            image: bottomNavigationBarEntity.activeImage,
            title: bottomNavigationBarEntity.name,
          )
        : InActiveItem(
            image: bottomNavigationBarEntity.inActiveImage,
          );
  }
}
