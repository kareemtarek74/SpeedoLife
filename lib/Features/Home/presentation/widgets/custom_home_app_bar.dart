import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:speedo_life/core/utils/app_images.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 52,
      child: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Image.asset(Assets.imagesLogo2)),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 14),
            child: Row(
              children: [
                SvgPicture.asset(Assets.imagesCartIcon),
                const SizedBox(
                  width: 16,
                ),
                SvgPicture.asset(Assets.imagesNotificationIcon),
                const SizedBox(
                  width: 16,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
