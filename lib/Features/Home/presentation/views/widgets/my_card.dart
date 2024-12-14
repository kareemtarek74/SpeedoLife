import 'package:flutter/material.dart';
import 'package:speedo_life/core/utils/app_images.dart';

class MyCard extends StatelessWidget {
  const MyCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 343 / 156,
        child: Container(
          decoration: const ShapeDecoration(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12))),
            image: DecorationImage(
                image: AssetImage(Assets.imagesSalePageView), fit: BoxFit.fill),
          ),
        ));
  }
}
