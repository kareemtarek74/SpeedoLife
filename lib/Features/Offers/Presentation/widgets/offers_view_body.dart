import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speedo_life/Features/Home/presentation/widgets/custom_home_app_bar.dart';
import 'package:speedo_life/Features/Home/presentation/widgets/search_text_field.dart';
import 'package:speedo_life/Features/Offers/Presentation/cubits/Offers%20Cubit/offers_cubit.dart';
import 'package:speedo_life/Features/Offers/Presentation/widgets/offers_list_view.dart';
import 'package:speedo_life/Features/Offers/Presentation/widgets/offers_shimmer.dart';

import '../../../../core/utils/text_styles.dart';

class OffersViewBody extends StatelessWidget {
  const OffersViewBody({super.key});

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
                          'التخفيضات',
                          style: Styles.styleBold20(context),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const SearchTextField(),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Text(
                          "العروض",
                          textAlign: TextAlign.right,
                          style: Styles.styleBold16(context),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: BlocBuilder<OffersCubit, OffersState>(
            builder: (context, state) {
              if (state is OffersLoading) {
                return const ShimmerOffersListView();
              } else if (state is OffersLoaded) {
                return OffersListView(
                  offers: state.offers,
                );
              } else if (state is OffersError) {
                return Center(child: Text(state.message));
              } else {
                return const SizedBox();
              }
            },
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 40,
          ),
        )
      ],
    );
  }
}
