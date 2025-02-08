import 'package:flutter/material.dart';
import 'package:speedo_life/Features/Offers/Data/model/offers_model.dart';
import 'package:speedo_life/core/widgets/cached_images.dart';

class OffersListView extends StatelessWidget {
  const OffersListView({
    super.key,
    required this.offers,
  });
  final List<Offer> offers;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: 3,
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              clipBehavior: Clip.antiAlias,
              child: ImageWithCache(
                imageUrl: offers[index].image,
                aspectRatio: 343 / 156,
              ),
            );
          },
        ),
      ),
    );
  }
}
