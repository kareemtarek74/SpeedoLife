import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speedo_life/Features/Home/presentation/widgets/sections_grid_view.dart';
import 'package:speedo_life/Features/Sections/presentation/cubits/Categories%20cubit/categories_cubit.dart';
import 'package:speedo_life/Features/Sections/presentation/view/widgets/sections_shimmer.dart';
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
                child: BlocBuilder<CategoriesCubit, CategoriesState>(
                  builder: (context, state) {
                    if (state is CategoriesLoading) {
                      return const ShimmerSectionsGridView();
                    } else if (state is CategoriesLoaded) {
                      return SectionsGridView(
                        sections: state.categories
                            .map((category) => {
                                  'name': category.name,
                                  'image': category.image,
                                  '_id': category.id,
                                })
                            .toList(),
                        scrollDirection: Axis.vertical,
                        childAspectRatio: 167 / 227,
                        style: Styles.styleSemiBold16(context)
                            .copyWith(color: const Color(0xff181818)),
                      );
                    } else if (state is CategoriesError) {
                      return Center(child: Text(state.message));
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
