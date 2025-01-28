import 'package:flutter/material.dart';
import 'package:speedo_life/Features/Sections/presentation/view/section_products_page_view.dart';
import 'package:speedo_life/core/widgets/cached_images.dart';

class SectionItem extends StatelessWidget {
  const SectionItem({
    super.key,
    required this.style,
    required this.name,
    required this.image,
  });

  final TextStyle? style;
  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, SectionProductsPageView.routeName,
            arguments: {
              'sectionName': name,
            });
      },
      child: Container(
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                  width: 120,
                  height: 140,
                  child: ImageWithCache(imageUrl: image)),
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Text(
                name,
                textAlign: TextAlign.center,
                style: style,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
