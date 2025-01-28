import 'package:flutter/material.dart';
import 'package:speedo_life/Features/Home/presentation/widgets/section_item.dart';

class SectionsGridView extends StatelessWidget {
  const SectionsGridView({
    super.key,
    required this.scrollDirection,
    required this.childAspectRatio,
    this.style,
    required this.sections,
  });

  final Axis scrollDirection;
  final double childAspectRatio;
  final TextStyle? style;
  final List sections;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: scrollDirection,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: childAspectRatio,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
      ),
      itemCount: sections.length,
      itemBuilder: (context, index) {
        return SectionItem(
          style: style,
          name: sections[index]['name'],
          image: sections[index]['image'],
          categoryId: sections[index]['_id'],
        );
      },
    );
  }
}
