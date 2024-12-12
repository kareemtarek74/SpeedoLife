import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:speedo_life/core/utils/app_images.dart';
import 'package:speedo_life/core/widgets/custom_text_field.dart';

class CustomPasswordField extends StatefulWidget {
  const CustomPasswordField({
    super.key,
    this.controller,
    this.hintStyle,
    required this.hintText,
    this.color,
  });
  final TextEditingController? controller;
  final TextStyle? hintStyle;
  final String hintText;
  final Color? color;

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      prefixIcon: SvgPicture.asset(
        Assets.imagesPassword,
        height: 24,
        width: 24,
        fit: BoxFit.scaleDown,
        color: widget.color,
      ),
      obscureText: obscureText,
      controller: widget.controller,
      hintText: widget.hintText,
      hintStyle: widget.hintStyle,
      suffixIcon: GestureDetector(
        onTap: () {
          setState(() {
            obscureText = !obscureText;
          });
        },
        child: obscureText
            ? const Icon(
                Icons.remove_red_eye_outlined,
                color: Color(0xffBABABA),
                size: 24,
              )
            : const Icon(
                Icons.visibility_off_outlined,
                color: Color(0xffBABABA),
                size: 24,
              ),
      ),
    );
  }
}
