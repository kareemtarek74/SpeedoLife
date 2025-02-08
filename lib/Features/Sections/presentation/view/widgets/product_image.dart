import 'package:flutter/material.dart';
import 'package:speedo_life/core/widgets/cached_images.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({
    super.key,
    required this.image,
  });
  final String image;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: double.infinity,
          height: 375,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1, color: Color(0xFFF1F1F1)),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: ImageWithCache(
              imageUrl: image,
              fit: BoxFit.scaleDown,
            ),
          ),
        ));
  }
}
