import 'package:flutter/material.dart';
import 'package:speedo_life/Features/Favourite/User/presentation/pages/user_view.dart';
import 'package:speedo_life/Features/Favourite/presentation/pages/favourite_view.dart';
import 'package:speedo_life/Features/Offers/Presentation/views/offers_view.dart';
import 'package:speedo_life/Features/Orders/presentation/pages/orders_view.dart';

import '../../../../Home/presentation/pages/home_view.dart';

class MainViewBody extends StatelessWidget {
  const MainViewBody({
    super.key,
    required this.currentViewIndex,
  });

  final int currentViewIndex;

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: currentViewIndex,
      children: const [
        HomeView(),
        OrdersView(),
        OffersView(),
        FavouriteView(),
        UserView()
      ],
    );
  }
}
