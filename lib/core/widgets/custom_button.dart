import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:speedo_life/core/utils/app_colors.dart';
import 'package:speedo_life/core/utils/app_images.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.style,
    required this.hasIcon,
    required this.onPressed,
  });
  final String text;
  final TextStyle? style;
  final bool hasIcon;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 12),
            fixedSize: Size(MediaQuery.sizeOf(context).width, 49),
            backgroundColor: AppColors.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
              visible: hasIcon,
              child: SvgPicture.asset(
                Assets.imagesLoginArrow,
                width: 20,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              text,
              style: style,
            ),
          ],
        ));
  }
}
