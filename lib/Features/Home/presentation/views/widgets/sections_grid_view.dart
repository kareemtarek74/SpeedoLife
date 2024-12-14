import 'package:flutter/material.dart';
import 'package:speedo_life/Features/Home/presentation/views/widgets/section_item.dart';

class SectionsGridView extends StatelessWidget {
  const SectionsGridView({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .44,
      child: GridView.builder(
          scrollDirection: Axis.horizontal,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 148 / 96,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
          ),
          itemBuilder: (context, index) {
            return const SectionItem();
          }),
    );
  }
}
