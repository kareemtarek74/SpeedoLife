import 'package:flutter/material.dart';
import 'package:speedo_life/core/widgets/cached_images.dart';

class HomeCategoryBody extends StatelessWidget {
  const HomeCategoryBody({
    super.key,
    required this.image,
    required this.name,
    required this.style,
  });

  final String image;
  final String name;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
              width: 120, height: 140, child: ImageWithCache(imageUrl: image)),
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
    );
  }
}
