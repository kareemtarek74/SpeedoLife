import 'package:flutter/material.dart';
import 'package:speedo_life/Features/Offers/Data/model/offers_model.dart';
import 'package:speedo_life/Features/Offers/Presentation/views/offers_produts_view.dart';
import 'package:speedo_life/Features/Offers/Presentation/widgets/offers_list_view_item.dart';

class OffersListView extends StatelessWidget {
  const OffersListView({
    super.key,
    required this.offers,
  });
  final List<Offer> offers;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: List.generate(offers.length, (index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                OffersProdutsView.routeName,
                arguments: {
                  'name': offers[index].name ?? '',
                  'offerId': offers[index].id,
                },
              );
            },
            child: Column(
              children: [
                OffersListViewItem(offer: offers[index]),
                if (index < offers.length - 1) const SizedBox(height: 16),
              ],
            ),
          );
        }),
      ),
    );
  }
}
