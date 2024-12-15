import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:speedo_life/core/utils/app_images.dart';
import 'package:speedo_life/core/utils/text_styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border.symmetric(
          horizontal: BorderSide(width: 1, color: Color(0xFFF1F1F1)),
        ),
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 16,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 14),
              child: SvgPicture.asset(Assets.imagesArrow),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              title,
              style: Styles.styleBold20(context),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 14),
            child: SvgPicture.asset(Assets.imagesCartIcon),
          ),
          const SizedBox(
            width: 16,
          )
        ],
      ),
    );
  }
}
