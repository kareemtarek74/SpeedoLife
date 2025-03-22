import 'package:flutter/material.dart';
import 'package:speedo_life/Features/Home/presentation/widgets/custom_home_app_bar.dart';
import 'package:speedo_life/core/utils/text_styles.dart';
import 'package:speedo_life/core/widgets/cached_images.dart';
import 'package:speedo_life/core/widgets/custom_cart_button.dart';
import 'package:speedo_life/core/widgets/favourite_icon.dart';

class FavouriteViewBody extends StatelessWidget {
  const FavouriteViewBody({super.key});

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
                          'المفضلة',
                          style: Styles.styleBold20(context),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const FavouriteProduct()
                  ],
                ),
              ),
            ],
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

class FavouriteProduct extends StatelessWidget {
  const FavouriteProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const SizedBox(
            height: 64,
            child: ImageWithCache(
              fit: BoxFit.scaleDown,
              imageUrl:
                  "http://209.250.237.58:5031/1736421343665_1736421265208_81.jpeg",
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "سيرافي لوشن ترطيب للبشرة الجافة مع حمض الهيالورونيك و السيراميد",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.styleSemiBold14(context),
                ),
                Text(
                  '50000 دينار',
                  style: Styles.styleBold16(context),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Row(
                  children: [
                    Expanded(
                      child: CustomCartButton(
                        padding: EdgeInsets.symmetric(vertical: 8),
                      ),
                    ),
                    FavouriteIcon()
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
