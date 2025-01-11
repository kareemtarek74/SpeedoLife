import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:speedo_life/Features/Sections/presentation/view/sections_view.dart';
import 'package:speedo_life/core/utils/app_colors.dart';

import '../../../../core/utils/text_styles.dart';

class SectionsHeader extends StatelessWidget {
  const SectionsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, SectionsView.routeName);
      },
      child: Row(
        children: [
          Text(
            'الأقسام',
            textAlign: TextAlign.right,
            style: Styles.styleBold16(context),
          ),
          const Spacer(),
          Row(
            children: [
              Text(
                'المزيد',
                textAlign: TextAlign.center,
                style: Styles.styleSemiBold14(context).copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 4, top: 4),
                child: Icon(
                  size: 16,
                  FontAwesomeIcons.chevronLeft,
                  color: AppColors.primaryColor,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
