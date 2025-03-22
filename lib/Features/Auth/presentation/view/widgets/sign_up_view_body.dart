import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:speedo_life/Features/Auth/presentation/cubits/SignUp/sign_up_cubit.dart';
import 'package:speedo_life/Features/Auth/presentation/view/sign_in_view.dart';
import 'package:speedo_life/core/utils/app_colors.dart';
import 'package:speedo_life/core/utils/app_images.dart';
import 'package:speedo_life/core/utils/text_styles.dart';
import 'package:speedo_life/core/widgets/custom_button.dart';
import 'package:speedo_life/core/widgets/custom_error%20_snack_bar.dart';
import 'package:speedo_life/core/widgets/custom_password_field.dart';
import 'package:speedo_life/core/widgets/custom_success_snack_bar.dart';
import 'package:speedo_life/core/widgets/custom_text_field.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
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
                      onSaved: (value) {
                        email = value!;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomPasswordField(
                      color: AppColors.primaryColor,
                      hintText: '********',
                      hintStyle: Styles.styleSemiBold16(context)
                          .copyWith(color: const Color(0xff181818)),
                      onSaved: (value) {
                        password = value!;
                      },
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
                    child: BlocConsumer<SignUpCubit, SignUpState>(
                      listener: (context, state) {
                        if (state is SignUpSuccess) {
                          Navigator.pop(context);
                          CustomSuccessSnackbar.showSuccess(
                              context: context,
                              message: "تم انشاء الحساب بنجاح");
                        } else if (state is SignUpFailure) {
                          CustomSnackbar.showError(
                              context: context, message: state.message);
                        }
                      },
                      builder: (context, state) {
                        if (state is SignUpLoading) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else {
                          return CustomButton(
                              text: 'إنشاء الحساب',
                              style: Styles.styleBold16(context)
                                  .copyWith(color: Colors.white),
                              hasIcon: false,
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  formKey.currentState!.save();
                                  context
                                      .read<SignUpCubit>()
                                      .createUserWithEmailAndPassword(
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
      ),
    );
  }
}
