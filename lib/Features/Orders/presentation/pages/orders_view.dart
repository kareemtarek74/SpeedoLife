import 'package:flutter/material.dart';
import 'package:speedo_life/Features/Orders/presentation/widgets/orders_view_body.dart';
import 'package:speedo_life/core/utils/app_colors.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: OrdersViewBody(),
    );
  }
}
