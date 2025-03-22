import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speedo_life/Features/Auth/presentation/view/sign_in_view.dart';
import 'package:speedo_life/Features/Favourite/User/presentation/cubits/cubit/user_info_cubit.dart';
import 'package:speedo_life/Features/Favourite/User/presentation/pages/contact_us_screen.dart';
import 'package:speedo_life/Features/Favourite/User/presentation/pages/map_screen.dart';
import 'package:speedo_life/Features/Favourite/User/presentation/widgets/user_item.dart';
import 'package:speedo_life/Features/Home/presentation/widgets/custom_home_app_bar.dart';
import 'package:speedo_life/core/utils/app_images.dart';
import 'package:speedo_life/core/utils/text_styles.dart';

class UserViewBody extends StatelessWidget {
  const UserViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserInfoCubit, UserInfoState>(
      builder: (context, state) {
        if (state is UserInfoLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is UserInfoLoaded) {
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const CustomHomeAppBar(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Text(
                                'الحساب',
                                style: Styles.styleBold20(context),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          UserItem(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                MapScreen.routeName,
                                arguments: {
                                  "latitude": state.userInfo.lat,
                                  "longitude": state.userInfo.lng,
                                },
                              );
                            },
                            icon: Assets.imagesLocation,
                            title: "العنوان",
                          ),
                          const SizedBox(height: 8),
                          UserItem(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                ContactUsScreen.routeName,
                                arguments: {
                                  "phoneNumber": state.userInfo.phone,
                                  "whatsapp": state.userInfo.whatsapp,
                                },
                              );
                            },
                            icon: Assets.imagesContact,
                            title: "إتصل بنا",
                          ),
                          const SizedBox(height: 8),
                          UserItem(
                            onTap: () {},
                            icon: Assets.imagesPrivacy,
                            title: "سياسة الخصوصية",
                          ),
                          const SizedBox(height: 8),
                          UserItem(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, SignInView.routeName);
                            },
                            icon: Assets.imagesLogin,
                            title: "تسجيل الدخول",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 40,
                ),
              )
            ],
          );
        } else {
          return const Center(child: Text("خطأ في جلب البيانات"));
        }
      },
    );
  }
}
