import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:speedo_life/core/utils/app_colors.dart';
import 'package:speedo_life/core/utils/app_images.dart';
import 'package:speedo_life/core/utils/text_styles.dart';
import 'package:speedo_life/core/widgets/custom_button.dart';
import 'package:speedo_life/core/widgets/custom_password_field.dart';
import 'package:speedo_life/core/widgets/custom_text_field.dart';

class SignInViewBody extends StatelessWidget {
  const SignInViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Image(
              width: double.infinity,
              fit: BoxFit.cover,
              image: AssetImage(Assets.imagesBackground1),
            ),
            const SizedBox(
              height: 34,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'تسجيل الدخول',
                    style: Styles.styleBold20(context),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const CustomTextFormField(
                    hintText: 'اسم المستخدم',
                    prefixIcon: Icon(
                      FontAwesomeIcons.circleUser,
                      color: Color(0xff181818),
                      size: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const CustomPasswordField(),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'نسيت كلمة السر',
                        style: Styles.styleBold12(context),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Stack(
              children: [
                Center(
                  child: SvgPicture.asset(Assets.imagesVector),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: CustomButton(
                      text: 'الدخول',
                      style: Styles.styleBold16(context)
                          .copyWith(color: Colors.white),
                      hasIcon: true,
                      onPressed: () {}),
                ),
                Positioned(
                    top: 100,
                    right: 120,
                    child: Column(
                      children: [
                        Text(
                          'ليس لديك حساب؟',
                          style: Styles.styleSemiBold14(context)
                              .copyWith(color: const Color(0xff555555)),
                        ),
                        Text(
                          'أنشئ حساب',
                          style: Styles.styleBold16(context)
                              .copyWith(color: AppColors.primaryColor),
                        )
                      ],
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
