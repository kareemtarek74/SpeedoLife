import 'package:flutter/material.dart';
import 'package:speedo_life/Features/Offers/Data/model/offers_model.dart';
import 'package:speedo_life/core/utils/app_colors.dart';
import 'package:speedo_life/core/utils/text_styles.dart';
import 'package:speedo_life/core/widgets/cached_images.dart';

class OffersListViewItem extends StatelessWidget {
  const OffersListViewItem({
    super.key,
    required this.offer,
  });

  final Offer offer;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(children: [
        ImageWithCache(
          imageUrl: offer.image,
          aspectRatio: 343 / 156,
        ),
        Positioned(
            right: 12,
            bottom: 12,
            child: Container(
              decoration: const ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(7)),
                      side:
                          BorderSide(color: AppColors.primaryColor, width: 1))),
              child: Row(
                children: [
                  const SizedBox(width: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      'تفقد المنتجات',
                      style: Styles.styleBold12(context)
                          .copyWith(color: AppColors.primaryColor),
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  const Icon(
                    Icons.chevron_right,
                    size: 16,
                    color: AppColors.primaryColor,
                  ),
                  const SizedBox(
                    width: 8,
                  )
                ],
              ),
            ))
      ]),
    );
  }
}
