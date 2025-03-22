import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:speedo_life/Features/Auth/presentation/cubits/SignIn/sign_in_cubit.dart';
import 'package:speedo_life/Features/Auth/presentation/view/sign_up_view.dart';
import 'package:speedo_life/Features/Main/presentation/views/main_view.dart';
import 'package:speedo_life/core/utils/app_colors.dart';
import 'package:speedo_life/core/utils/app_images.dart';
import 'package:speedo_life/core/utils/text_styles.dart';
import 'package:speedo_life/core/widgets/custom_button.dart';
import 'package:speedo_life/core/widgets/custom_error%20_snack_bar.dart';
import 'package:speedo_life/core/widgets/custom_password_field.dart';
import 'package:speedo_life/core/widgets/custom_success_snack_bar.dart';
import 'package:speedo_life/core/widgets/custom_text_field.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  late String email, password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidateMode: _autovalidateMode,
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
                    CustomTextFormField(
                      hintText: 'ايميل المستخدم',
                      hintStyle: Styles.styleSemiBold16(context)
                          .copyWith(color: const Color(0xff808080)),
                      prefixIcon: const Icon(
                        FontAwesomeIcons.circleUser,
                        color: Color(0xff181818),
                        size: 20,
                      ),
                      onSaved: (value) {
                        email = value!;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomPasswordField(
                      color: const Color(0xff181818),
                      hintText: 'كلمة السر',
                      hintStyle: Styles.styleSemiBold16(context)
                          .copyWith(color: const Color(0xff808080)),
                      onSaved: (value) {
                        password = value!;
                      },
                    ),
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
                    child: BlocConsumer<SignInCubit, SignInState>(
                      listener: (context, state) {
                        if (state is SignInSuccess) {
                          Navigator.pushNamedAndRemoveUntil(
                              context, MainView.routeName, (_) => false);
                          CustomSuccessSnackbar.showSuccess(
                              context: context,
                              message: "تم تسجيل الدخول بنجاح");
                        } else if (state is SignInFailure) {
                          CustomSnackbar.showError(
                              context: context, message: state.message);
                        }
                      },
                      builder: (context, state) {
                        if (state is SignInLoading) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else {
                          return CustomButton(
                              text: 'الدخول',
                              style: Styles.styleBold16(context)
                                  .copyWith(color: Colors.white),
                              hasIcon: true,
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  formKey.currentState!.save();
                                  context
                                      .read<SignInCubit>()
                                      .signInWithEmailAndPassword(
                                          email, password);
                                } else {
                                  setState(() {
                                    _autovalidateMode = AutovalidateMode.always;
                                  });
                                }
                              });
                        }
                      },
                    ),
                  ),
                  Positioned(
                      top: 100,
                      right: 120,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, SignUpView.routeName);
                        },
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
                        ),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
