import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speedo_life/Features/Sections/presentation/cubits/Products%20Cubit/products_cubit.dart';
import 'package:speedo_life/Features/Sections/presentation/view/widgets/products_grid_view.dart';
import 'package:speedo_life/Features/Sections/presentation/view/widgets/products_shimmer.dart';
import 'package:speedo_life/core/widgets/custom_app_bar.dart';

class SectionProductsPageViewBody extends StatelessWidget {
  final String categoryId;
  final String categoryName;

  const SectionProductsPageViewBody({
    super.key,
    required this.categoryId,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              CustomAppBar(title: categoryName),
            ],
          ),
        ),
        SliverFillRemaining(
          child: BlocBuilder<ProductsCubit, ProductsState>(
            builder: (context, state) {
              if (state is ProductsLoading) {
                return const ProductsShimmer();
              } else if (state is ProductsLoaded) {
                return ProductsGridView(
                  products: state.products,
                );
              } else if (state is ProductsError) {
                return Center(
                  child: Text(state.message),
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        ),
      ],
    );
  }
}
