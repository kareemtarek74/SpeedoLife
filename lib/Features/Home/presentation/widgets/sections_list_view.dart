import 'package:flutter/material.dart';
import 'package:speedo_life/Features/Home/presentation/widgets/section_item.dart';

class SectionsHorizontalListView extends StatelessWidget {
  const SectionsHorizontalListView({
    super.key,
    this.height,
    this.style,
    required this.sections,
  });

  final double? height;
  final TextStyle? style;
  final List sections;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 150,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: sections.length,
        separatorBuilder: (context, index) => const SizedBox(width: 16),
        itemBuilder: (context, index) {
          return SectionItem(
            style: style,
            name: sections[index]['name'],
            image: sections[index]['image'],
            categoryId: sections[index]['_id'],
          );
        },
      ),
    );
  }
}
