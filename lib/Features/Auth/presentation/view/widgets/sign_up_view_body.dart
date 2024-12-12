import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:speedo_life/Features/Auth/presentation/view/widgets/sign_in_view.dart';
import 'package:speedo_life/core/utils/app_colors.dart';
import 'package:speedo_life/core/utils/app_images.dart';
import 'package:speedo_life/core/utils/text_styles.dart';
import 'package:speedo_life/core/widgets/custom_button.dart';
import 'package:speedo_life/core/widgets/custom_password_field.dart';
import 'package:speedo_life/core/widgets/custom_text_field.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

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
                    'إنشاء حساب',
                    style: Styles.styleBold20(context),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  CustomTextFormField(
                    hintText: 'karim.ali@mail.com',
                    hintStyle: Styles.styleSemiBold16(context)
                        .copyWith(color: const Color(0xff181818)),
                    prefixIcon: const Icon(
                      FontAwesomeIcons.circleUser,
                      color: AppColors.primaryColor,
                      size: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomPasswordField(
                    color: AppColors.primaryColor,
                    hintText: '********',
                    hintStyle: Styles.styleSemiBold16(context)
                        .copyWith(color: const Color(0xff181818)),
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
                      text: 'إنشاء الحساب',
                      style: Styles.styleBold16(context)
                          .copyWith(color: Colors.white),
                      hasIcon: false,
                      onPressed: () {}),
                ),
                Positioned(
                    top: 100,
                    right: 120,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, SignInView.routeName);
                      },
                      child: Column(
                        children: [
                          Text(
                            'لديك حساب بالفعل؟',
                            style: Styles.styleSemiBold14(context)
                                .copyWith(color: const Color(0xff555555)),
                          ),
                          Text(
                            'سجل الدخول',
                            style: Styles.styleBold16(context)
                                .copyWith(color: AppColors.primaryColor),
                          )
                        ],
                      ),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
