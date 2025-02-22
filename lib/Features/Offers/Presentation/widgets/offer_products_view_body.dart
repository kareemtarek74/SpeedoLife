import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speedo_life/Features/Offers/Presentation/cubits/Offer%20Products/offer_products_cubit.dart';
import 'package:speedo_life/Features/Offers/Presentation/cubits/Offer%20categories%20cubit/offer_categories_cubit.dart';
import 'package:speedo_life/Features/Offers/Presentation/widgets/shimmer_offer_categories.dart';
import 'package:speedo_life/Features/Offers/Presentation/widgets/sub_categories_list_view.dart';
import 'package:speedo_life/Features/Sections/presentation/view/widgets/products_grid_view.dart';
import 'package:speedo_life/Features/Sections/presentation/view/widgets/sections_shimmer.dart';
import 'package:speedo_life/core/widgets/custom_app_bar.dart';

class OfferProductsViewBody extends StatefulWidget {
  const OfferProductsViewBody(
      {super.key, required this.name, required this.offerId});

  final String name;
  final String offerId;

  @override
  OfferProductsViewBodyState createState() => OfferProductsViewBodyState();
}

class OfferProductsViewBodyState extends State<OfferProductsViewBody> {
  String? selectedCategoryId;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              CustomAppBar(
                title: widget.name,
              ),
              const SizedBox(height: 8),
              BlocBuilder<OfferCategoriesCubit, OfferCategoriesState>(
                builder: (context, state) {
                  if (state is OfferCategoriesLoading) {
                    return const ShimmerOfferCategories();
                  } else if (state is OfferCategoriesLoaded) {
                    if (selectedCategoryId == null &&
                        state.categories.isNotEmpty) {
                      selectedCategoryId = state.categories.first.id;
                      context
                          .read<OfferProductsCubit>()
                          .fetchProducts(widget.offerId, selectedCategoryId!);
                    }

                    return SubCategoriesListView(
                      categories: state.categories,
                      onCategorySelected: (selectedCategoryId) {
                        setState(() {
                          this.selectedCategoryId = selectedCategoryId;
                        });
                        context
                            .read<OfferProductsCubit>()
                            .fetchProducts(widget.offerId, selectedCategoryId);
                      },
                      selectedCategoryId: selectedCategoryId,
                    );
                  } else if (state is OfferCategoriesError) {
                    return Center(child: Text(state.message));
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ],
          ),
        ),
        BlocBuilder<OfferProductsCubit, OfferProductsState>(
          builder: (context, state) {
            if (state is OfferProductsLoading) {
              return const SliverFillRemaining(
                child: ShimmerSectionsGridView(),
              );
            } else if (state is OfferProductsLoaded) {
              return SliverFillRemaining(
                child: ProductsGridView(
                  products: state.products,
                ),
              );
            } else if (state is OfferProductsError) {
              return SliverFillRemaining(
                child: Center(child: Text(state.message)),
              );
            } else {
              return const SliverFillRemaining(child: SizedBox());
            }
          },
        ),
      ],
    );
  }
}
