import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:speedo_life/core/utils/text_styles.dart';

class UserItem extends StatelessWidget {
  const UserItem({
    super.key,
    this.onTap,
    required this.icon,
    required this.title,
  });
  final void Function()? onTap;
  final String icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: Row(
          children: [
            const SizedBox(
              width: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: SvgPicture.asset(icon),
            ),
            const SizedBox(
              width: 12,
            ),
            Text(
              title,
              style: Styles.styleSemiBold16(context),
            )
          ],
        ),
      ),
    );
  }
}
