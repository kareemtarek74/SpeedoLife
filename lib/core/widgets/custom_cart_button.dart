import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:speedo_life/core/utils/app_colors.dart';
import 'package:speedo_life/core/utils/app_images.dart';
import 'package:speedo_life/core/utils/text_styles.dart';

class CustomCartButton extends StatelessWidget {
  const CustomCartButton({
    super.key,
    required this.padding,
    this.iconSize,
    this.style,
  });
  final EdgeInsetsGeometry padding;
  final double? iconSize;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: padding,
            child: SvgPicture.asset(
              Assets.imagesButtonCart,
              width: iconSize,
              height: iconSize,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 7),
            child: Text(
              'أضف للسلة',
              style: style ??
                  Styles.styleBold14(context).copyWith(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
