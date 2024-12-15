import 'package:flutter/material.dart';
import 'package:speedo_life/core/utils/app_images.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: double.infinity,
          height: 375,
          decoration: ShapeDecoration(
            image: const DecorationImage(
              image: AssetImage(Assets.imagesProduct),
              fit: BoxFit.fill,
            ),
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1, color: Color(0xFFF1F1F1)),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ));
  }
}
