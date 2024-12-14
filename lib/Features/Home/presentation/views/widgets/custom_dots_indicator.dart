import 'package:flutter/material.dart';
import 'package:speedo_life/Features/Home/presentation/views/widgets/custom_dot.dart';

class CustomDotsIndicator extends StatelessWidget {
  const CustomDotsIndicator({super.key, required this.pageNum});
  final int pageNum;
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
            4,
            (index) => Padding(
                  padding: const EdgeInsets.only(right: 6),
                  child: CustomDot(
                    isActive: pageNum == index,
                  ),
                )));
  }
}
