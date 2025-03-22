import 'package:flutter/material.dart';
import 'package:speedo_life/Features/Favourite/User/presentation/widgets/contact_us_screen_body.dart';
import 'package:speedo_life/core/utils/app_colors.dart';
import 'package:speedo_life/core/utils/text_styles.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen(
      {super.key, required this.phone, required this.whatsapp});
  static const String routeName = "contact_ us";
  final String phone, whatsapp;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        titleSpacing: 0,
        leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              Icons.chevron_left,
              size: 34,
            )),
        title: Text(
          "تواصل معنا",
          style: Styles.styleBold20(context),
        ),
      ),
      body: ContactUsScreenBody(
        phone: phone,
        whatapp: whatsapp,
      ),
    );
  }
}
