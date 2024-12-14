import 'package:flutter/material.dart';
import 'package:speedo_life/Features/Home/presentation/views/favourite_view.dart';
import 'package:speedo_life/Features/Home/presentation/views/orders_view.dart';
import 'package:speedo_life/Features/Home/presentation/views/sale_view.dart';
import 'package:speedo_life/Features/Home/presentation/views/user_view.dart';

import '../home_view.dart';

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
        SaleView(),
        FavouriteView(),
        UserView()
      ],
    );
  }
}
