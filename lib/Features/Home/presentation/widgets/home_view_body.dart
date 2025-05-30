import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speedo_life/Features/Home/presentation/cubits/Home%20Cubit/home_cubit.dart';
import 'package:speedo_life/Features/Home/presentation/widgets/custom_home_app_bar.dart';
import 'package:speedo_life/Features/Home/presentation/widgets/home_page_view_section.dart';
import 'package:speedo_life/Features/Home/presentation/widgets/search_text_field.dart';
import 'package:speedo_life/Features/Home/presentation/widgets/sections_header.dart';
import 'package:speedo_life/Features/Home/presentation/widgets/sections_list_view.dart';
import 'package:speedo_life/Features/Home/presentation/widgets/shimmer_categories.dart';
import 'package:speedo_life/Features/Home/presentation/widgets/shimmer_slider.dart';
import 'package:speedo_life/Features/Sections/data/model/products_model.dart';
import 'package:speedo_life/core/utils/text_styles.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
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
                          'الرئيسية',
                          style: Styles.styleBold20(context),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const SearchTextField(),
                    const SizedBox(height: 24),
                    BlocBuilder<HomeCubit, HomeState>(
                      builder: (context, state) {
                        if (state is HomeLoading) {
                          return const ShimmerSlider();
                        } else if (state is HomeLoaded) {
                          return HomePageViewSection(
                            sliders: state.data['sliders'],
                          );
                        } else if (state is HomeError) {
                          return Center(child: Text(state.message));
                        } else {
                          return const SizedBox();
                        }
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const SectionsHeader(
                      text: 'الأقسام',
                      products: [],
                      isTrend: true,
                    ),
                    const SizedBox(height: 16),
                    BlocBuilder<HomeCubit, HomeState>(
                      builder: (context, state) {
                        if (state is HomeLoading) {
                          return const ShimmerCategories();
                        } else if (state is HomeLoaded) {
                          return SectionsHorizontalListView(
                            height: MediaQuery.of(context).size.height * .3,
                            style: Styles.styleSemiBold12(context).copyWith(
                                color: const Color(0xff181818), fontSize: 14),
                            sections: state.data['categories'],
                          );
                        } else if (state is HomeError) {
                          return Center(child: Text(state.message));
                        } else {
                          return const SizedBox();
                        }
                      },
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    BlocBuilder<HomeCubit, HomeState>(
                      builder: (context, state) {
                        if (state is HomeLoading) {
                          return const ShimmerCategories();
                        } else if (state is HomeLoaded) {
                          List sections = state.data['bestSeller'];
                          List<Product> products = sections
                              .map((json) => Product.fromJson(json))
                              .toList();
                          return Column(
                            children: [
                              SectionsHeader(
                                isCategories: false,
                                text: 'الأكثر طلبا',
                                products: products,
                                isTrend: true,
                              ),
                              const SizedBox(height: 16),
                              SectionsHorizontalListView(
                                isProduct: true,
                                height: MediaQuery.of(context).size.height * .4,
                                style: Styles.styleSemiBold12(context).copyWith(
                                    color: const Color(0xff181818),
                                    fontSize: 14),
                                sections: state.data['bestSeller'],
                              ),
                            ],
                          );
                        } else if (state is HomeError) {
                          return Center(child: Text(state.message));
                        } else {
                          return const SizedBox();
                        }
                      },
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    BlocBuilder<HomeCubit, HomeState>(
                      builder: (context, state) {
                        if (state is HomeLoading) {
                          return const ShimmerCategories();
                        } else if (state is HomeLoaded) {
                          List sections = state.data['newProducts'];
                          List<Product> products = sections
                              .map((json) => Product.fromJson(json))
                              .toList();
                          return Column(
                            children: [
                              SectionsHeader(
                                isCategories: false,
                                text: 'وصل حديثا',
                                products: products,
                                isTrend: false,
                              ),
                              const SizedBox(height: 16),
                              SectionsHorizontalListView(
                                isTrend: false,
                                isProduct: true,
                                height: MediaQuery.of(context).size.height * .4,
                                style: Styles.styleSemiBold12(context).copyWith(
                                    color: const Color(0xff181818),
                                    fontSize: 14),
                                sections: state.data['newProducts'],
                              ),
                            ],
                          );
                        } else if (state is HomeError) {
                          return Center(child: Text(state.message));
                        } else {
                          return const SizedBox();
                        }
                      },
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
