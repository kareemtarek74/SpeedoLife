import 'package:flutter/material.dart';
import 'package:speedo_life/core/utils/app_images.dart';
import 'package:speedo_life/core/utils/text_styles.dart';

class SectionItem extends StatelessWidget {
  const SectionItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: ShapeDecoration(
          color: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AspectRatio(
                  aspectRatio: 80 / 80,
                  child: Image.asset(Assets.imagesWatchs)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
              child: Text(
                'الساعات و الاكسسوارات',
                textAlign: TextAlign.center,
                style: Styles.styleSemiBold12(context)
                    .copyWith(color: const Color(0xff181818)),
              ),
            )
          ],
        ));
  }
}
