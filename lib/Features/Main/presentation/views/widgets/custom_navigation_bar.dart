import 'package:flutter/material.dart';
import 'package:speedo_life/Features/Main/Domain/Entities/buttom_vavigation_bar_entity.dart';
import 'package:speedo_life/Features/Main/presentation/views/widgets/navigation_bar_item.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
    required this.onItemTapped,
    required this.selectedIndex,
  });

  final ValueChanged<int> onItemTapped;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375,
      height: 70,
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 25,
            offset: Offset(0, -2),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        children: bottomNavigationBarItems.asMap().entries.map((e) {
          var index = e.key;
          var entity = e.value;

          return Expanded(
            child: GestureDetector(
              onTap: () => onItemTapped(index),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 150),
                transitionBuilder: (child, animation) {
                  return ScaleTransition(
                    scale: animation,
                    child: child,
                  );
                },
                child: NaivgationBarItem(
                  key: ValueKey(index == selectedIndex),
                  isSelected: index == selectedIndex,
                  bottomNavigationBarEntity: entity,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
