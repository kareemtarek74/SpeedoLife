import 'package:flutter/material.dart';
import 'package:speedo_life/Features/Home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:speedo_life/Features/Home/presentation/views/widgets/home_page_view_section.dart';
import 'package:speedo_life/Features/Home/presentation/views/widgets/search_text_field.dart';
import 'package:speedo_life/Features/Home/presentation/views/widgets/sections_grid_view.dart';
import 'package:speedo_life/Features/Home/presentation/views/widgets/sections_header.dart';
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
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Text(
                          'الرئيسية',
                          style: Styles.styleBold20(context),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const SearchTextField(),
                    const SizedBox(
                      height: 24,
                    ),
                    const HomePageViewSection(),
                    const SectionsHeader(),
                    const SizedBox(
                      height: 8,
                    ),
                    const SectionsGridView()
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
