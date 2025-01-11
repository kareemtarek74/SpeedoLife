import 'package:flutter/material.dart';
import 'package:speedo_life/Features/Sections/presentation/view/section_products_page_view.dart';
import 'package:speedo_life/core/utils/app_images.dart';

class SectionItem extends StatelessWidget {
  const SectionItem({super.key, required this.style});
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, SectionProductsPageView.routeName);
      },
      child: Container(
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
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Text(
                  'الساعات و الاكسسوارات',
                  textAlign: TextAlign.center,
                  style: style,
                ),
              )
            ],
          )),
    );
  }
}
