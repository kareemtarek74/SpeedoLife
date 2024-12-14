import 'package:flutter/material.dart';
import 'package:speedo_life/Features/Home/presentation/views/widgets/sections_grid_view.dart';
import 'package:speedo_life/core/utils/text_styles.dart';
import 'package:speedo_life/core/widgets/custom_app_bar.dart';

class SectionsViewBody extends StatelessWidget {
  const SectionsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              const CustomAppBar(
                title: 'الأقسام',
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SectionsGridView(
                  scrollDirection: Axis.vertical,
                  childAspectRatio: 167 / 227,
                  height: MediaQuery.of(context).size.height,
                  style: Styles.styleSemiBold16(context)
                      .copyWith(color: const Color(0xff181818)),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
