import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:speedo_life/core/utils/app_images.dart';
import 'package:speedo_life/core/widgets/custom_text_field.dart';

class CustomPasswordField extends StatefulWidget {
  const CustomPasswordField({
    super.key,
    this.controller,
  });
  final TextEditingController? controller;

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
      ),
      obscureText: obscureText,
      controller: widget.controller,
      hintText: 'كلمة السر',
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
