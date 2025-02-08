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
    return SizedBox(
      height: MediaQuery.sizeOf(context).height,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: offers.length,
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, OffersProdutsView.routeName,
                      arguments: {
                        'name': offers[index].name ?? '',
                        'offerId': offers[index].id
                      });
                },
                child: OffersListViewItem(offer: offers[index]));
          },
        ),
      ),
    );
  }
}
