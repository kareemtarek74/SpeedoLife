import 'package:flutter/material.dart';
import 'package:speedo_life/Features/Favourite/User/presentation/widgets/user_item.dart';
import 'package:speedo_life/core/services/copy_to_clipboard.dart';
import 'package:speedo_life/core/utils/app_images.dart';
import 'package:speedo_life/core/utils/text_styles.dart';

class ContactUsScreenBody extends StatelessWidget {
  const ContactUsScreenBody(
      {super.key, required this.phone, required this.whatapp});
  final String phone, whatapp;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const SizedBox(height: 16),
                Row(
                  children: [
                    Text(
                      'وسائل التواصل',
                      style: Styles.styleBold20(context),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                UserItem(
                  onTap: () {
                    copyToClipboard(context, phone);
                  },
                  icon: Assets.imagesContact,
                  title: phone,
                ),
                const SizedBox(height: 8),
                UserItem(
                  onTap: () {},
                  icon: Assets.imagesWhatsapp,
                  title: whatapp,
                ),
                const SizedBox(height: 8),
                UserItem(
                  onTap: () {},
                  icon: Assets.imagesInstagram,
                  title: "انستاقرام",
                ),
                const SizedBox(height: 8),
                const UserItem(
                  icon: Assets.imagesAddress,
                  title: "البصرة, شارع القطار",
                ),
              ],
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 40,
          ),
        )
      ],
    );
  }
}
