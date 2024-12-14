import 'package:flutter/material.dart';
import 'package:speedo_life/Features/Home/Domain/Entities/buttom_vavigation_bar_entity.dart';
import 'package:speedo_life/Features/Home/presentation/views/widgets/active_item.dart';
import 'package:speedo_life/Features/Home/presentation/views/widgets/in_active_item.dart';

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
        ? ActiveItem(
            image: bottomNavigationBarEntity.activeImage,
          )
        : InActiveItem(
            image: bottomNavigationBarEntity.inActiveImage,
          );
  }
}
