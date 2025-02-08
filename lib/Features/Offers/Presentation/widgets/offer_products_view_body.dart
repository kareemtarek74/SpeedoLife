import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speedo_life/Features/Offers/Presentation/cubits/Offer%20categories%20cubit/offer_categories_cubit.dart';
import 'package:speedo_life/Features/Offers/Presentation/widgets/shimmer_offer_categories.dart';
import 'package:speedo_life/Features/Offers/Presentation/widgets/sub_categories_list_view.dart';
import 'package:speedo_life/core/widgets/custom_app_bar.dart';

class OfferProductsViewBody extends StatelessWidget {
  const OfferProductsViewBody({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              CustomAppBar(
                title: name,
              ),
              const SizedBox(
                height: 8,
              ),
              BlocBuilder<OfferCategoriesCubit, OfferCategoriesState>(
                builder: (context, state) {
                  if (state is OfferCategoriesLoading) {
                    return const ShimmerOfferCategories();
                  } else if (state is OfferCategoriesLoaded) {
                    return SubCategoriesListView(categories: state.categories);
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
      ],
    );
  }
}
