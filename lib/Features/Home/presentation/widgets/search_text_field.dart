import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:speedo_life/core/utils/app_colors.dart';
import 'package:speedo_life/core/utils/app_images.dart';
import 'package:speedo_life/core/utils/text_styles.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color(0x0A000000),
                    blurRadius: 9,
                    offset: Offset(0, 2),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.only(right: 24, top: 8, bottom: 8),
                  suffixIcon: SizedBox(
                    width: 20,
                    child: Center(
                      child: SvgPicture.asset(Assets.imagesSearch),
                    ),
                  ),
                  hintStyle: Styles.styleSemiBold14(context).copyWith(
                    color: const Color(0xFF808080),
                  ),
                  hintText: 'ابحث عن منتج...',
                  filled: true,
                  fillColor: AppColors.secondaryColor,
                  border: buildBorder(),
                  enabledBorder: buildBorder(),
                  focusedBorder: buildBorder(),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          SvgPicture.asset(Assets.imagesFilter)
        ],
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(24),
      borderSide: const BorderSide(
        width: 1,
        color: Color(0xffDBDBDB),
      ),
    );
  }
}
