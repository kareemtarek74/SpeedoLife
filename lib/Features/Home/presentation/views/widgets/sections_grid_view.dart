import 'package:flutter/material.dart';
import 'package:speedo_life/Features/Home/presentation/views/widgets/section_item.dart';

class SectionsGridView extends StatelessWidget {
  const SectionsGridView({
    super.key,
    required this.scrollDirection,
    required this.childAspectRatio,
    this.height,
    this.style,
  });
  final Axis scrollDirection;
  final double childAspectRatio;
  final double? height;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: GridView.builder(
          scrollDirection: scrollDirection,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: childAspectRatio,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
          ),
          itemBuilder: (context, index) {
            return SectionItem(
              style: style,
            );
          }),
    );
  }
}
