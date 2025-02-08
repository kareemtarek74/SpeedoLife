import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speedo_life/Features/Offers/Presentation/cubits/Offer%20categories%20cubit/offer_categories_cubit.dart';
import 'package:speedo_life/Features/Offers/Presentation/widgets/offer_products_view_body.dart';
import 'package:speedo_life/core/utils/app_colors.dart';

class OffersProdutsView extends StatelessWidget {
  const OffersProdutsView(
      {super.key, required this.name, required this.offerId});
  static const String routeName = 'offersProdutsView';
  final String name;
  final String offerId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.secondaryColor,
        body: SafeArea(
            child: BlocProvider<OfferCategoriesCubit>(
          create: (context) => OfferCategoriesCubit()..fetchCategories(offerId),
          child: OfferProductsViewBody(
            name: name,
          ),
        )));
  }
}
