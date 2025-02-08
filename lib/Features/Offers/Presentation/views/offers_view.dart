import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speedo_life/Features/Offers/Presentation/cubits/Offers%20Cubit/offers_cubit.dart';
import 'package:speedo_life/Features/Offers/Presentation/widgets/offers_view_body.dart';
import 'package:speedo_life/core/utils/app_colors.dart';
import 'package:speedo_life/injection_container.dart' as di;

class OffersView extends StatelessWidget {
  const OffersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.secondaryColor,
        body: BlocProvider<OffersCubit>(
          create: (context) => di.sl<OffersCubit>()..loadOffers(),
          child: const OffersViewBody(),
        ));
  }
}
